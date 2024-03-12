
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chính sách bảo mật</title>
        <link href='https://fonts.googleapis.com/css?family=Baloo' rel='stylesheet'>

        <style>
            body{
                background-color: #F0F0F0;
            }
            .all {
                margin-top: 50px;
                font-family: sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                text-align: justify;
            }

            .container {
                width: 70%;
                background-color: white;
                padding: 15px 40px;
                box-sizing: border-box;
                border-radius: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            }

            .title {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .container h1 {
                font-family: 'Baloo';
                color: rgb(7, 7, 146);
                opacity: 80%;
                border-bottom: 1px solid grey;
                margin: 0px;
                text-align: center;
                margin-left: 40px;
            }

            .container h2 {
                font-family: 'Baloo';
                font-size: 22px;
                font-weight: bolder;
                margin: 0px;
                margin-top: 30px;

            }

            .container li, .container p {
                font-size: 15px;
                opacity: 80%;
                margin: 5px 0px;
                line-height: 1.2;
            }
        </style>
    </head>

    <body>
        <c:if test="${sessionScope.account == null}">
            <div>
                <jsp:include page="menu_nologin.jsp"/>
            </div>
        </c:if>
            
        <c:if test="${sessionScope.account != null}">
            <div>
                <jsp:include page="menu_logined.jsp"/>
            </div>
        </c:if>
        
            
        <br><br><br>
        <div class="all">
            <div class="container">
                <div class="title">
                    <img src="../image/rules.png" alt="">
                    <h1>ĐIỀU KHOẢN SỬ DỤNG DỊCH VỤ VỚI ỨNG VIÊN</h1>
                </div>

                <h2>1. THU THẬP THÔNG TIN CÁ NHÂN</h2>
                <ol>
                    <li>Khi đăng ký Dịch vụ của JobsVn</li>
                    <ul>
                        <li>Khi đăng ký bất cứ Dịch vụ nào của JobsVn, bạn sẽ được yêu cầu cung cấp một số thông tin cá nhân
                            nhất định để thiết lập tài khoản của bạn, để xác thực danh tính theo quy định của pháp luật hiện
                            hành (bao gồm cả các lần cập nhật).</li>
                        <li>Bất cứ thông tin cá nhân nào do JobsVn yêu cầu được đánh dấu “Bắt buộc”, bạn phải cung cấp và đồng ý
                            để JobsVn xử lý thông tin này. Nếu bạn không đồng ý cung cấp thông tin cá nhân này và/hoặc không
                            đồng ý để chúng tôi xử lý thông tin theo quy định tại Chính Sách Bảo Mật này, JobsVn sẽ không thể
                            cung cấp các dịch vụ liên quan và việc đăng ký dịch vụ của bạn sẽ bị từ chối.</li>
                    </ul>

                    <li>Từ việc sử dụng các Dịch vụ của JobsVn của bạn. Chúng tôi thu thập thông tin cá nhân trực tiếp từ bạn
                        khi bạn chọn lựa tham gia vào bất kỳ Dịch vụ nào của JobsVn. Dưới đây là các ví dụ về thông tin cá nhân
                        mà JobsVn có thể thu thập trực tiếp từ bạn: tuổi, ngày sinh, điện thoại cố định hoặc số điện thoại di
                        động, hình ảnh cá nhân, học vấn, sở thích cá nhân, kinh nghiệm làm việc, lịch sử truy cập, tìm việc, ứng
                        tuyển, các thông tin khác liên quan đến Hồ sơ việc làm (CV) của bạn, các thông tin liên quan đến việc sử
                        dụng các công cụ tính lương, bài thi trắc nghiệm.</li>
                    <li>Khi bạn truy cập các Dịch vụ của JobsVn</li>
                    <ul>
                        <li>Khi bạn truy cập bất cứ trang web nào thuộc hệ thống JobsVn, máy chủ trang web của chúng tôi sẽ tự
                            động thu thập thông tin truy cập của bạn tại các trang web này, bao gồm địa chỉ IP, thời gian, ngày
                            và thời lượng truy cập. Địa chỉ IP của bạn là thiết bị định dạng duy nhất cho máy tính của bạn hoặc
                            các thiệt bị truy cập khác.</li>
                        <li>JobsVn có thể theo dõi quá trình truy cập của bạn tại bất cứ trang web nào thuộc hệ thống JobsVn,
                            bằng cách cài đặt một “cookie” trong máy tính của bạn hoặc các thiết bị truy cập khác khi bạn đăng
                            nhập. Cookies là các tập tin văn bản nhỏ được đặt trên máy tính của bạn hoặc thiết bị truy cập khác
                            bởi các trang web mà bạn truy cập. Chúng được sử dụng rộng rãi để làm cho trang web hoạt động, hoặc
                            hoạt động hiệu quả hơn, cũng như cung cấp thông tin cho chủ sở hữu của các trang web.</li>
                        <li>Cookies cho phép JobsVn lưu lại các trạng thái dữ liệu của bạn để bạn sẽ không phải đăng nhập lại
                            trong lần truy cập sau. Cookies cũng giúp JobsVn thu thập luồng dữ liệu truy cập ẩn danh để theo dõi
                            xu hướng và mẫu người dùng. JobsVn có thể sử dụng luồng dữ liệu truy cập ẩn danh để giúp các nhà
                            quảng cáo cung cấp quảng cáo nhắm tới mục tiêu tốt hơn.</li>
                    </ul>
                </ol>

                <h2>2. MỤC ĐÍCH THU THẬP VÀ SỬ DỤNG THÔNG TIN CÁ NHÂN</h2>
                <ol>
                    <li>Mục đích xử lý thông tin cá nhân bởi JobsVn:</li>
                    <ul>
                        <li>Xác định danh tính của bạn.</li>
                        <li>Đánh giá và/hoặc xác định khả năng làm việc và mức độ tín nhiệm của bạn.</li>
                        <li>Phân tích thông tin hồ sơ của bạn để giới thiệu gợi ý việc làm cho bạn dựa trên thông tin phân tích.
                        </li>
                        <li>Chia sẻ thông tin dữ liệu tìm việc và hồ sơ ứng viên của bạn cho nhà tuyển dụng.</li>
                        <li>Cung cấp một trong các Dịch vụ của JobsVn mà bạn đã yêu cầu.</li>
                        <li>Điều hành và quản lý các Dịch vụ của JobsVn đã cung cấp cho bạn.</li>
                        <li>Liên lạc với bạn về các vấn đề liên quan đến việc sử dụng Dịch vụ của JobsVn.</li>
                        <li>Cải thiện các cơ hội thay đổi công việc của bạn hoặc sắp xếp các dịch vụ cụ thể cho bạn.</li>
                        <li>Xác minh trình độ học vấn và nghề nghiệp của bạn bằng việc liên lạc trường học/cao đẳng/đại học/viện
                            nghiên cứu/các cơ quan chuyên môn.</li>
                        <li>Xử lý đơn yêu cầu trong quá trình sử dụng Dịch vụ của JobsVn mà bạn đã yêu cầu.</li>
                        <li>Điều tra và giải quyết các khiếu nại hoặc thắc mắc khác mà bạn gửi đến JobsVn liên quan đến các Dịch
                            vụ của JobsVn.</li>
                        <li>Giám sát và cải thiện việc thực hiện các Dịch vụ của JobsVn.</li>
                        <li>Duy trì và phát triển các Dịch vụ của JobsVn.</li>
                        <li>Am hiểu về các nhu cầu thông tin và liên lạc của bạn để JobsVn nâng cao và điều chỉnh các Dịch vụ
                            của JobsVn.</li>
                        <li>Tiến hành nghiên cứu và phát triển và phân tích thống kê liên quan đến các Dịch vụ của JobsVn để xác
                            định xu hướng và phát triển các dịch vụ mới đáp ứng ứng sự quan tâm của bạn.</li>
                        <li>Hỗ trợ JobsVn am hiểu các lựa chọn duyệt thông tin ưu tiên của bạn để JobsVn có thể điều chỉnh nội
                            dung phù hợp.</li>
                        <li>Phát hiện và ngăn chặn hoạt động gian lận, lừa đảo, vi phạm pháp luật.</li>
                    </ul>

                    <li>Giới hạn về việc hạn chế xử lý thông tin cá nhân:</li>
                    <p>Bạn không thể hạn chế việc xử lý thông tin cá nhân của bạn cho các mục đích quy định ở trên, bởi vì đây
                        là mục đích của bạn khi sử dụng dịch vụ của JobsVn và là cách để JobsVn có thể đáp ứng dịch vụ của bạn.
                        Nếu bạn không đồng ý để JobsVn xử lý thông tin cá nhân của bạn cho các mục đích trên, bạn phải chấm dứt
                        thỏa thuận liên quan của bạn với JobsVn cho các dịch vụ của JobsVn và ngừng sử dụng các dịch vụ do
                        JobsVn cung cấp.</p>

                    <li>Yêu cầu đồng ý trước khi xử lý thông tin cá nhân:</li>
                    <p>JobsVn sẽ yêu cầu sự đồng ý của bạn trước khi xử lý thông tin cá nhân ngoài các mục quy định ở mục 1.</p>

                    <li>Mục đích sử dụng thông tin cá nhân bổ sung:</li>
                    <ul>
                        <li>Thúc đẩy và giới thiệu đến bạn các dịch vụ khác của JobsVn như: Giới thiệu việc làm, Giới thiệu khóa
                            học, sự kiện, tin tức, Kết nối nhà tuyển dụng...</li>
                        <li>Các dịch vụ của các bên thứ ba mà JobsVn thấy phù hợp với sự quan tâm của bạn.</li>
                        <li>Gửi đến bạn các tin nhắn chúc mừng và/hoặc tin nhắn thông báo lỗi trên các trang Web JobsVn và/hoặc
                            các thông tin dịch vụ của JobsVn.</li>
                        <li>Gửi đến bạn các hướng dẫn, lời khuyên và thông tin khảo sát để tối đa hóa sự phát triển nghề nghiệp
                            của bạn bao gồm nhưng không giới hạn đối với việc sử dụng các dịch vụ của JobsVn.</li>
                    </ul>
                </ol>

                <h2>3. ĐĂNG KÝ</h2>
                <ol>
                    <li>JobsVn trao cho bạn sự chọn lựa để CV của mình trong Cơ Sở Dữ Liệu Hồ Sơ JobsVn:</li>
                    <p>Có hai cách để thực hiện:</p>
                    <ul>
                        <li>
                            Bạn có thể lưu trữ hồ sơ của bạn trong Cơ Sở Dữ Liệu Hồ Sơ JobsVn, nhưng không cho phép hồ sơ này
                            được
                            tìm kiếm bởi Nhà tuyển dụng hoặc các Đơn vị quảng cáo hoặc các Chủ sở hữu tài khoản JobsVn Partner.
                            Không cho phép hồ sơ của bạn được tìm kiếm có nghĩa là bạn có thể sử dụng nó để nộp đơn xin việc
                            trực
                            tuyến, nhưng Nhà tuyển dụng hoặc các Đơn vị quảng cáo hoặc các Chủ sở hữu tài khoản JobsVn Partner
                            sẽ
                            không có quyền truy cập để tìm kiếm thông qua cơ sở dữ liệu Cơ Sở Dữ Liệu Hồ Sơ JobsVn.
                        </li>
                        <li>
                            Bạn có thể cho phép thông tin hồ sơ và thông tin dữ liệu tìm việc của bạn được tìm kiếm bởi hoặc
                            hoặc
                            gợi ý cho những Nhà tuyển dụng hoặc các Đơn vị quảng cáo hoặc các Chủ sở hữu tài khoản JobsVn
                            Partner.
                            Khi bạn lựa chọn để hồ sơ của mình được tìm kiếm hoặc gợi ý, toàn bộ thông tin lý lịch, thông tin cá
                            nhân, và dữ liệu tìm việc của bạn sẽ hiển thị đối với các Nhà tuyển dụng hoặc các Đơn vị quảng cáo
                            hoặc
                            các Chủ sở hữu tài khoản JobsVn Partner khi họ lưu trữ qua Cơ Sở Dữ Liệu Hồ Sơ JobsVn.
                        </li>
                    </ul>
                    <p>Trong trường hợp bạn đồng ý chia sẻ với Nhà tuyển dụng về thông tin dữ liệu tìm việc của bạn, JobsVn sẽ
                        trở
                        thành đơn vị trung gian kết nối và chia sẻ thông tin này cho Nhà tuyển dụng dựa trên sự đồng ý của bạn.
                        Việc
                        kết nối này có thể phát sinh một số khoản phí để duy trì hoạt động vận hành của hệ thống, tuy nhiên,
                        toàn bộ
                        các khoản phí này sẽ do Nhà tuyển dụng phải chi trả và Ứng viên không phải chi trả khoản phí này.</p>

                    <li>JobsVn nỗ lực hạn chế quyền truy cập vào Cơ Sở Dữ Liệu Hồ Sơ JobsVn:</li>
                    <p>Mà chỉ dành cho những người đã đăng ký với các Dịch vụ của JobsVn, những người này có thể giữ lại một bản
                        sao
                        của hồ sơ của bạn trong các tập tin hoặc cơ sở dữ liệu riêng của họ. Tuy nhiên, trong mọi trường hợp,
                        bạn là
                        người có quyền chấp thuận hoặc từ chối để Nhà tuyển dụng truy cập vào Hồ Sơ của bạn.</p>
                    <li>JobsVn sẽ thực hiện các bước hợp lý để các bên chưa được đề cập ở trên sẽ không đạt được quyền truy cập
                        vào Cơ Sở Dữ Liệu Hồ Sơ JobsVn, khi chưa có sự đồng ý của JobsVn. Tuy nhiên, JobsVn không chịu trách
                        nhiệm
                        đối với việc lưu giữ, sử dụng hoặc tính bảo mật của hồ sơ của bất kỳ bên thứ ba nào.</li>
                    <li>Mặc dù quy định tại Khoản 3.1, JobsVn có quyền truy cập đầy đủ đến hồ sơ của bạn cho mục đích quy định
                        tại Khoản 2.1 để thực hiện các Dịch vụ JobsVn.</li>
                    <li>Bạn có thể được kích hoạt lại tài khoản khi đã bị vô hiệu hóa nếu được sự chấp thuận từ JobsVn.</li>
                    <li>Ngoài các quyền được quy định tại các khoản 1, 2, 3, 4, 5, Điều này, bạn có đầy đủ các quyền của chủ thể
                        dữ liệu được quy định tại Điều 9 Nghị định 13/2023/NĐ-CP về Bảo vệ dữ liệu cá nhân.</h2>
                </ol>

                <h2>4. LỰA CHỌN VÀ TRUY CẬP THÔNG TIN CÁ NHÂN</h2>
                <ol>
                    <li>Bạn có thể có những quan tâm về quyền bảo mật khác nhau. Mục tiêu của JobsVn là làm rõ các thông tin mà
                        chúng tôi thu thập, để bạn có thể có các lựa chọn ý nghĩa về cách sử dụng. Ví dụ:</li>
                    <ul>
                        <li>Bạn có thể kiểm soát người mà bạn muốn chia sẻ thông tin cá nhân.</li>
                        <li>Bạn có thể xem lại và kiểm soát việc đăng ký của bạn đối với các lựa chọn tiếp thị khác nhau, các
                            Dịch vụ JobsVn. Bạn có thể xem, chỉnh sửa hoặc xóa thông tin cá nhân và các mục ưa thích bất cứ lúc
                            nào.</li>
                        <li>Bạn có thể lựa chọn không tiếp nhận bất cứ tài liệu tiếp thị nào từ JobsVn.</li>
                        <li>Bạn cũng có thể đăng ký các Dịch vụ JobsVn bổ sung bằng cách đăng nhập vào tài khoản của bạn trên
                            trang chủ của chúng tôi.</li>
                    </ul>

                    <li>Xóa tài khoản:</li>
                    <p>Bạn có thể xóa tài khoản của mình bất cứ lúc nào và khi đó JobsVn sẽ hủy tất cả quyền truy cập đến tài
                        khoản và hồ sơ trong cơ sở dữ liệu. Việc xóa tài khoản của bạn sẽ không ảnh hưởng đến những hồ sơ mà bạn
                        đã gửi đến các Nhà tuyển dụng hoặc được lưu xuống bởi các Nhà tuyển dụng, Chủ sở hữu tài khoản (muốn có
                        CV) được thực hiện trước thời điểm bạn gửi yêu cầu xóa tài khoản đến JobsVn.</p>
                    <p>Dưới đây là các bước để bạn có thể xóa tài khoản của mình khỏi hệ thống của JobsVn:</p>
                    <ol>
                        <li>Gửi email về hòm mail <a href="mailto:hotro@JobsVn.vn">hotro@JobsVn.vn</a> với tiêu đề "Yêu cầu xóa
                            tài khoản".</li>
                        <li>Sau khi JobsVn nhận được yêu cầu qua email, chúng tôi sẽ liên hệ lại để xác nhận thông tin.</li>
                        <li>Thực hiện xóa tài khoản khỏi hệ thống và thông báo phản hồi lại qua email trong thời hạn 72 giờ, kể
                            từ thời điểm nhận được yêu cầu của bạn.</li>
                    </ol>
                </ol>

                <h2>5. LƯU TRỮ THÔNG TIN CÁ NHÂN</h2>
                <p>JobsVn sẽ lưu trữ thông tin cá nhân của bạn trong khoảng thời gian cần thiết để đáp ứng các mục đích quy định
                    tại Khoản 2 bên trên và cho bất cứ mục đích pháp lý hoặc kinh doanh nào.</p>
                <p>Sau khi chấm dứt hoặc vô hiệu hóa tài khoản của bạn, JobsVn, Chi nhánh hoặc Nhà cung cấp dịch vụ của JobsVn
                    có thể giữ lại thông tin (bao gồm thông tin trang cá nhân của bạn) và Nội dung của người dùng trong khoảng
                    thời gian hợp lý về mặt thương mại cho các mục đích sao lưu, lưu trữ và/hoặc kiểm tra theo quy định của pháp
                    luật Việt Nam.</p>


                <h2>6. BẢO MẬT THÔNG TIN CÁ NHÂN</h2>
                <ol>
                    <li>JobsVn cam kết bảo mật thông tin cá nhân của bạn. JobsVn có quy trình kỹ thuật, hành chính và vật chất
                        thích hợp để chống mất mát, trộm cắp và lạm dụng, cũng như chống lại việc truy cập trái phép, tiết lộ,
                        thay đổi và tiêu hủy thông tin. Thông tin nhạy cảm (như là số thẻ ngân hàng, thẻ tín dụng) được nhập vào
                        các dịch vụ cổng thanh toán của chúng tôi hoặc đối tác thanh toán sẽ được mã hóa trong quá trình truyền
                        tải thông tin bằng cách sử dụng công nghệ SSL.</li>
                    <li>Tuy nhiên, không có phương pháp truyền tải qua Internet hoặc phương pháp lưu trữ điện tử nào là an toàn
                        100%. Do đó, chúng tôi không thể đảm bảo bảo mật tuyệt đối. Nếu bạn có bất kỳ câu hỏi nào về việc bảo
                        mật trên JobsVn, bạn có thể liên hệ với chúng tôi qua email hotro@JobsVn.vn.</li>
                </ol>

                <h2>7. NHỮNG BÊN THỨ BA ĐƯỢC SỬ DỤNG THÔNG TIN</h2>
                <ol>
                    <li>Các Bên Thứ Ba Có Thể Sử Dụng Thông Tin Cá Nhân:</li>
                    <p>Thông tin cá nhân đề cập ở Khoản 1 trên đây có thể được công bố/sử dụng bởi các bên thứ ba sau đây nhằm
                        kết
                        nối các Dịch vụ của JobsVn và bạn đến các cơ hội phù hợp:</p>
                    <ul>
                        <li>Các Nhà tuyển dụng / Doanh nghiệp đang có nhu cầu tuyển dụng nhân sự.</li>
                        <li>Các bên thứ ba ký hợp đồng với JobsVn để hỗ trợ JobsVn thực hiện tất cả hoặc một phần các Dịch vụ
                            JobsVn
                            cho bạn, bao gồm nhưng không giới hạn, các dịch vụ sau:
                            <ul>
                                <li>Dịch vụ hồ sơ/đánh giá.</li>
                                <li>Dịch vụ nghiên cứu thị trường và phân tích sử dụng trang web.</li>
                                <li>Cung cấp các thông tin, khóa học, sự kiện phù hợp.</li>
                            </ul>
                        </li>
                        <li>Các đối tác chiến lược làm việc với JobsVn để cung cấp một trong các Dịch vụ của JobsVn hoặc để hỗ
                            trợ
                            tiếp thị và giới thiệu tới người dùng JobsVn.</li>
                        <li>Trường học/cao đẳng/đại học/viện nghiên cứu mà bạn đã theo học hoặc người giới thiệu để xác minh
                            trình
                            độ học vấn của bạn.</li>
                        <li>Các cơ quan chuyên nghiệp nơi bạn được công nhận trình độ chuyên môn.</li>
                        <li>Các tư vấn chuyên nghiệp của JobsVn khi có nhu cầu tìm hiểu cơ bản với mục đích tư vấn cho JobsVn.
                        </li>
                        <li>Bất cứ bên thứ ba nào sở hữu một phần hoặc tất cả tài sản hoặc việc kinh doanh của JobsVn (bao gồm
                            các
                            khách hàng và các khoản phải thu thương mại) nhằm mục đích hỗ trợ bên thứ ba tiếp tục cung cấp một
                            phần
                            hoặc toàn bộ các Dịch vụ JobsVn mà họ sở hữu.</li>
                        <li>Các trường hợp khác được cho phép theo quy định pháp luật về bảo mật dữ liệu.</li>
                    </ul>

                    <li>Thông Báo Và Quyền Lựa Chọn:</li>
                    <p>Ngoài những trường hợp ở trên, bạn sẽ được thông báo khi thông tin cá nhân của bạn có thể đi đến các bên
                        thứ
                        ba, và bạn sẽ có cơ hội lựa chọn không chia sẻ thông tin này.</p>

                    <li>Cấm Chia Sẻ Thông Tin:</li>
                    <p>JobsVn không cho phép bất kỳ bên thứ ba nào được phép chia sẻ lại thông tin đã được cung cấp cho một bên
                        khác
                        hoặc sử dụng không đúng mục đích đã được ký kết trong hợp đồng với JobsVn.</p>
                </ol>

                <h2>8. NGHĨA VỤ CỦA BẠN ĐỐI VỚI THÔNG TIN CÁ NHÂN CỦA MÌNH</h2>
                <ol>
                    <li>Bạn có trách nhiệm cung cấp cho JobsVn các thông tin của bạn và cá nhân của người nào mà bạn cung cấp
                        cho chúng tôi một cách chính xác, không gây nhầm lẫn, đầy đủ và gần nhất, và có trách nhiệm cập nhật
                        thông tin cá nhân này khi có sự sai lệch, nhầm lẫn, không đầy đủ và lỗi thời bằng cách liên lạc với
                        JobsVn qua email hotro@JobsVn.vn.</li>
                    <li>Trong trường hợp bạn có nhu cầu cung cấp thông tin cá nhân của một người nào đó cho JobsVn mà không phải
                        là thông tin của bạn (ví dụ, người giới thiệu hoặc người bảo lãnh), bạn nên thông báo những người này về
                        việc cung cấp thông tin cá nhân của họ cho JobsVn, nhằm đảm bảo sự đồng ý của họ cho việc cung cấp thông
                        tin và để họ biết địa chỉ để tìm Thông Báo Chính Sách này (tại mục Chính Sách Bảo Mật trên trang web của
                        chúng tôi).</li>
                    <li>Ngoài các nghĩa vụ được quy định tại Khoản 1, 2 Điều này, bạn có đầy đủ các nghĩa vụ của chủ thể dữ liệu
                        theo quy định tại Điều 12 Nghị định 13/2023/NĐ-CP.</li>
                </ol>

                <h2>9. HẬU QUẢ, THIỆT HẠI KHÔNG MONG MUỐN CÓ KHẢ NĂNG XẢY RA</h2>
                <ol>
                    <li>Mất dữ liệu vào các đối tượng mà ứng viên cho phép nhầm/ lỗi.</li>
                    <li>Các đối tượng lừa đảo sử dụng thông tin cá nhân của bạn để thực hiện các mục tiêu bất hợp pháp sau khi
                        được bạn chia sẻ.</li>
                    <li>JobsVn có thể đánh giá và phân tích sai dữ liệu của bạn khi bạn không có sự cập nhật thường xuyên khi có
                        thay đổi.</li>
                </ol>

                <h2>10. THỜI GIAN BẮT ĐẦU, THỜI GIAN KẾT THÚC XỬ LÝ DỮ LIỆU</h2>
                <p>Từ ngày chính sách này có hiệu lực cho đến ngày Bạn (chủ sở hữu dữ liệu) có yêu cầu bằng văn bản về việc từ
                    chối cho phép xử lý dữ liệu gửi cho JobsVn theo thông tin liên lạc bên dưới.</p>

                <h2>11. CHUYỂN THÔNG TIN CÁ NHÂN NGOÀI PHẠM VI ĐỊA PHƯƠNG CỦA BẠN</h2>
                <p>JobsVn có thể cần chuyển thông tin cá nhân của bạn ra ngoài phạm vi địa phương của bạn nếu có bất kỳ nhà cung
                    cấp dịch vụ hoặc các đối tác chiến lược (“các công ty nước ngoài”) tham gia cung cấp một phần của một trong
                    các Dịch vụ của JobsVn.</p>

                <h2>12. CÁC TRANG LIÊN KẾT</h2>
                <ol>
                    <li>Các trang web thuộc JobsVn có thể chứa các liên kết đến các trang của bên thứ ba. JobsVn không chịu
                        trách nhiệm đối với các trang web của các bên thứ ba này. Bất cứ thông tin cá nhân nào của bạn sẵn có
                        trên các trang đó sẽ không được hưởng lợi từ Chính Sách Bảo Mật này và sẽ phụ thuộc vào chính sách bảo
                        mật của bên thứ ba liên quan (nếu có). Chúng tôi không chịu trách nhiệm đối với những thực tiễn được
                        triển khai bởi bất kỳ trang web hoặc dịch vụ nào được liên kết đến hoặc từ Dịch vụ của chúng tôi, bao
                        gồm thông tin hoặc nội dung có trong đó. Xin lưu ý rằng khi bạn sử dụng liên kết để đi từ Dịch vụ của
                        chúng tôi đến trang web hoặc dịch vụ khác, Chính sách bảo mật của chúng tôi không áp dụng đối với những
                        trang web hoặc dịch vụ bên thứ ba đó. Quá trình duyệt web và tương tác của bạn trên bất kỳ trang web
                        hoặc dịch vụ của bên thứ ba nào, bao gồm trang web hoặc dịch vụ có liên kết trên trang web của chúng
                        tôi, phải tuân theo các quy định và chính sách của riêng bên thứ ba đó. Ngoài ra, bạn đồng ý rằng chúng
                        tôi không có trách nhiệm và không có quyền kiểm soát đối với bất kỳ bên thứ ba nào mà bạn cho phép truy
                        cập vào Nội dung của người dùng của mình. Nếu bạn đang sử dụng trang web hoặc dịch vụ bên thứ ba và bạn
                        cho phép trang web hoặc dịch vụ đó truy cập vào Nội dung của người dùng của mình, bạn phải tự chịu rủi
                        ro khi thực hiện việc đó.</li>
                    <li>Bạn có thể truy cập vào trang của chúng tôi bằng cách sử dụng dịch vụ đăng nhập như là Facebook Connect.
                        Dịch vụ này sẽ xác thực danh tính của bạn và cung cấp cho bạn các tùy chọn để chia sẻ thông tin cá nhân
                        nhất định với chúng tôi như tên và địa chỉ email để nhập trước vào mẫu đăng ký của chúng tôi. Các dịch
                        vụ như Facebook Connect cung cấp cho bạn các tùy chọn để đăng thông tin về các hoạt động của bạn trên
                        trang web này trên trang hồ sơ cá nhân của bạn để chia sẻ với những người khác trong mạng lưới của bạn.
                    </li>
                    <li>Trang web của chúng tôi bao gồm các Tính năng Truyền thông Xã hội, chẳng hạn như các widget và nút
                        like/share/comment Facebook, hoặc các chương trình tương tác mini chạy trên trang web của chúng tôi.
                        Những tính năng này có thể thu thập địa chỉ IP của bạn, trang mà bạn đang truy cập trên trang web của
                        chúng tôi, và có thể cài đặt cookies để kích hoạt các Tính năng hoạt động tốt. Các Tính năng Truyền
                        thông Xã hội và các widget được cung cấp bởi bên thứ ba hoặc cung cấp trực tiếp trên trang web của chúng
                        tôi. Sự tương tác của bạn với những Tính năng này được quản lý bởi chính sách bảo mật của bên cung cấp.
                    </li>
                </ol>

                <h2>13. SỰ ĐỒNG Ý CỦA BẠN</h2>
                <ol>
                    <li>Khi sử dụng các Dịch vụ của JobsVn, bạn đồng ý với việc thu thập và sử dụng thông tin cá nhân của JobsVn
                        như được mô tả ở phần trên (có thể thay đổi theo thời gian) trừ khi và cho đến khi bạn thông báo điều
                        ngược lại với JobsVn qua email hotro@JobsVn.vn.</li>
                    <li>Bên cạnh đó, bạn đồng ý với việc người giới thiệu, các trường học/cao đẳng/đại học/ học viện mà bạn đã
                        theo học, các cơ quan chuyên môn nơi bạn được công nhận trình độ chuyên môn và các Nhà tuyển dụng công
                        bố thông tin các nhân của bạn với JobsVn.</li>
                </ol>

                <h2>14. QUYỀN RIÊNG TƯ CỦA TRẺ EM</h2>
                <p>JobsVn không chủ định thu thập hoặc yêu cầu bất kỳ thông tin nào từ bất kỳ ai dưới 13 tuổi hoặc không chủ ý
                    cho phép những người đó đăng ký Dịch vụ. Dịch vụ và nội dung của Dịch vụ không nhắm tới trẻ em dưới 13 tuổi.
                    Trong trường hợp chúng tôi biết rằng mình đã thu thập thông tin cá nhân từ trẻ em dưới 13 tuổi mà không có
                    sự chấp thuận của cha mẹ, chúng tôi sẽ xóa thông tin đó nhanh nhất có thể. Nếu bạn cho rằng chúng tôi có thể
                    có thông tin từ hoặc về trẻ dưới 13 tuổi, vui lòng liên hệ với chúng tôi.</p>

                <h2>THÔNG TIN LIÊN LẠC</h2>
                <p>Nếu bạn có câu hỏi về Thông Báo Chính Sách này, vui lòng gửi email tới địa chỉ hotro@JobsVn.vn để được giải đáp nhanh nhất.</p>

            </div>
        </div>
        
        <div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>

</html>