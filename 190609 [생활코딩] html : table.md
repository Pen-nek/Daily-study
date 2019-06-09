# 생활코딩 html : table  

## 배운 코드
    <html>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>이름</th>  <th>성별</th>  <th>주소</th>  <th>회비</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>박인혜</td>  <td>여</td>  <td rowspan="2">청주</td>  <td>1,000</td>
                </tr>
                <tr>
                    <td>박인아</td>  <td>남</td>  <td>500</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3";>합계</td><td>1,500</td>
                </tr>
            </tfoot>
        </table>
    </body>
    </html>  

## 결과
<html>
<body>
    <table border="1">
        <thead>
            <tr>
                <th>이름</th>  <th>성별</th>  <th>주소</th>  <th>회비</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>박인혜</td>  <td>여</td>  <td rowspan="2">청주</td>  <td>1,000</td>
            </tr>
            <tr>
                <td>박인아</td>  <td>남</td>  <td>500</td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="3";>합계</td><td>1,500</td>
            </tr>
        </tfoot>
    </table>
</body>
</html>

- 추가 : 과거 레이아웃에는 table 태그가 사용되었음.
