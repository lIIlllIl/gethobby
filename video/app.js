const fs = require('fs');
const ffmpeg = require('fluent-ffmpeg');
const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors());

const audioPath = 'C:/video/';
const m3u8Path = 'C:/Users/User/Desktop/video/video/';
app.get('/videoEncoding/:videoname', function(req, res) { 
	console.log('encoding start...');
      var tmpAudioFilePath = audioPath + req.params.videoname;
      ffmpeg(tmpAudioFilePath, { timeout: 432000 }).addOptions([
				'-profile:v baseline',
				'-level 3.0', 
				'-start_number 0',   
				'-hls_time .1',      
				'-hls_list_size 0',   
				'-f hls',           
				'-hls_key_info_file enc.keyinfo' 
			]).output(m3u8Path + '/'  + req.params.videoname.split('.')[0] + '.m3u8')
			.on('end', function() {
				console.log('ffmpeg tranform succesfully finished');
				res.writeHead(201, {
					'Content-Type': 'text/html'
				});
				res.end();
			})
			.on('error', function(err) {
				console.error('Error while ffmpeg processing:', err)
				res.writeHead(500);
				res.end();
			})
      .run()
});

app.get('/videoPreview/:videoname', function(req, res) {    
    const path = 'C:/video/' + req.params.videoname;
    const stat = fs.statSync(path)
    const fileSize = stat.size
    const range = req.headers.range

    if (range) {
      const parts = range.replace(/bytes=/, "").split("-")
      const start = parseInt(parts[0], 10)
      const end = parts[1]
        ? parseInt(parts[1], 10)
        : fileSize-1

      if(start >= fileSize) {
        res.status(416).send('시작 지점이 동영상 크기보다 클 수 없습니다.\n'+start+' >= '+fileSize);
        return
      }

      const chunksize = (end-start)+1
      const file = fs.createReadStream(path, {start, end})
      const head = {
        'Content-Range': `bytes ${start}-${end}/${fileSize}`,
        'Accept-Ranges': 'bytes',
        'Content-Length': chunksize,
        'Content-Type': 'video/mp4',
      }

      res.writeHead(206, head)
      file.pipe(res)
    } else {
      const head = {
        'Content-Length': fileSize,
        'Content-Type': 'video/mp4',
      }
      res.writeHead(200, head)
      fs.createReadStream(path).pipe(res)
    }
});

app.get('/video/:videoname', function(req, res) {
	var fileName = req.params.videoname;
	var filePath = m3u8Path + fileName;
	res.download(filePath);
});

app.get('/key/:keyname', function(req, res) {
	var keyName = req.params.keyname;
	var keyPath = m3u8Path + keyName;
	res.download(keyPath);
});

app.listen(3000, function () {
  console.log('Listening on port 3000!')
})