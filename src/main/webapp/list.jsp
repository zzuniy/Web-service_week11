<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="true" %>

<html>
<head>
    <title>게시물 목록</title>
    <style>
        body { font-family: Arial, sans-serif; max-width:900px; margin:20px auto; padding:0 16px; }
        ul#list { list-style:none; padding:0; margin:0; }
        ul#list li { padding:12px; border-bottom:1px solid #eee; }
        ul#list li a { font-weight:600; color:#333; text-decoration:none; }
        ul#list li .meta { color:#666; font-size:0.9em; margin-top:6px; }
        #status { color:#666; margin-bottom:12px; }

        .top-actions .btn {

            display: inline-block;
            padding: 8px 16px;
            margin-left: 800px;
            background-color: black;
            color: white;
            text-decoration: none;
            border-radius: 4px;

            transition: background-color 0.3s;
        }

        .top-actions .btn:hover {
            background-color: #45a049; /* 마우스 오버 시 색 살짝 변함 */
        }

    </style>
</head>
<body>
<h1>ZZUNIY'S WORLD</h1>
<div class="top-actions">
    <a href="write.jsp" class="btn">글쓰기</a>
</div>


<div id="status">로딩 중...</div>
<ul id="list"></ul>

<script>
    fetch('https://68db331c23ebc87faa323bc7.mockapi.io/employee')
        .then(response => response.json())
        .then(data => {
            const list = document.getElementById('list');
            const status = document.getElementById('status');
            status.style.display = 'none';

            data.forEach(item => {
                const li = document.createElement('li');

                let createdDate = '';
                if(item.createdAt) {
                    const d = new Date(item.createdAt);
                    createdDate = d.toLocaleString();
                }

                li.innerHTML = `
                    <a href="view.jsp?id=${item.id}" class="title">${item.title}</a>

                    <div class="meta">
                        작성자: ${item.name} | 작성일: ${createdDate}
                    </div>

                    <div class="preview">
                        ${item.detail ? item.detail.substring(0, 100) : ''}...
                    </div>


                `;
                list.appendChild(li);
                console.log('script 실행됨');
            });
        })
        .catch(err => {
            document.getElementById('status').innerText = '데이터 로딩 실패';
            console.error(err);
        });
</script>
</body>
</html>
