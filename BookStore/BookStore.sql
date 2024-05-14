-- Create database
CREATE DATABASE BookStore
GO
USE BookStore
GO
-----*crate table-----
CREATE TABLE Categories(
	CategoryId INT IDENTITY PRIMARY KEY,
	CategoryName NVARCHAR(100) UNIQUE NOT NULL
)
GO
CREATE TABLE Publishers(
	PublisherId INT IDENTITY PRIMARY KEY,
	PublisherName NVARCHAR(200) NOT NULL,
	Phone VARCHAR(30) UNIQUE NOT NULL,
	Address NVARCHAR(200)	
)
GO
CREATE TABLE Books(
	BookId VARCHAR(10) PRIMARY KEY,
	Title NVARCHAR(200) UNIQUE NOT NULL,
	Author NVARCHAR(100),
	Release INT,
	Price FLOAT,
	Description NTEXT,
	Picture NVARCHAR(100),
	PublisherId INT,
	CategoryId INT
)
GO
CREATE TABLE Account(
	AccountId VARCHAR(36) PRIMARY KEY,
	UserName VARCHAR(64) NOT NULL,
	Password VARCHAR(256),
	FullName NVARCHAR(100),
	Picture VARCHAR(512),
	Email VARCHAR(64) UNIQUE NOT NULL,
	Address NVARCHAR(256),
	Phone VARCHAR(64),
	IsAdmin BIT,
	Active BIT
)
GO
CREATE TABLE OrderBook(
	OrderId VARCHAR(16) PRIMARY KEY,
	OrderDate DATETIME,
	AccountId VARCHAR(36),
	ReceiveAddress NVARCHAR(512),
	ReceivePhone VARCHAR(50),
	ReceiveDate DATETIME,
	Note NVARCHAR(512),
	Status BIT,
)
GO
CREATE TABLE OrderDetail(
	OrderDetailId INT Identity(1,1) PRIMARY KEY,
	OrderId VARCHAR(16),
	BookId VARCHAR(10),
	Quantity INT,
	Price FLOAT
)
GO

-----ForeignKey
ALTER TABLE dbo.Books ADD FOREIGN KEY(CategoryId) REFERENCES dbo.Categories(CategoryId);
GO
ALTER TABLE dbo.Books ADD FOREIGN KEY(PublisherId) REFERENCES dbo.Publishers(PublisherId);
GO
ALTER TABLE dbo.OrderBook ADD FOREIGN KEY(AccountId) REFERENCES dbo.Account(AccountId);
GO
ALTER TABLE dbo.OrderDetail ADD FOREIGN KEY (OrderId) REFERENCES dbo.OrderBook(OrderId);
GO
ALTER TABLE dbo.OrderDetail ADD FOREIGN KEY (BookId) REFERENCES dbo.Books(BookId);

---INSERT
INSERT INTO dbo.Categories
(
    CategoryName
)
VALUES
(N'Sách Thiếu Nhi'),
(N'Sách Văn Học'),
(N'Sách Kỹ Năng Sống'),
(N'Sách Kinh Tế'),
(N'Sách Học Ngoại Ngữ'),
(N'Sách Bà Mẹ Em Bé'),
(N'Sách Y Học'),
(N'Sách Lịch Sử'),
(N'Sách Chính Trị-Pháp Lý'),
(N'Sách Tôn Giáo Tâm Linh'),
(N'Sách Tâm Lý-Giới Tính')
GO
--Insert data in Publisher
INSERT INTO dbo.Publishers
(
    PublisherName,
    Phone,
    Address
)
VALUES
(   N'Alphabooks', -- PublisherName - nvarchar(200)
    '0339513657',  -- Phone - varchar(30)
    N''  -- Address - nvarchar(200)
    ),
	(   N'MCBOOKS', -- PublisherName - nvarchar(200)
    '0339513658',  -- Phone - varchar(30)
    N''  -- Address - nvarchar(200)
    ),
	(   N'Nhà Xuất Bản Kim Đồng', -- PublisherName - nvarchar(200)
    '0339513659',  -- Phone - varchar(30)
    N''  -- Address - nvarchar(200)
    ),
	(   N'NXB Trẻ', -- PublisherName - nvarchar(200)
    '0339513660',  -- Phone - varchar(30)
    N''  -- Address - nvarchar(200)
    ),
	(   N'Minh Long', -- PublisherName - nvarchar(200)
    '0339513661',  -- Phone - varchar(30)
    N''  -- Address - nvarchar(200)
    ),
	(   N'Hồng Vân', -- PublisherName - nvarchar(200)
    '0339513662',  -- Phone - varchar(30)
    N''  -- Address - nvarchar(200)
    ),
	(   N'NXB Kim Đồng', -- PublisherName - nvarchar(200)
    '0339513663',  -- Phone - varchar(30)
    N''  -- Address - nvarchar(200)
    )
GO
--Insert data in product
INSERT INTO dbo.Books
(
    BookId,
    Title,
    Author,
    Release,
    Price,
    Description,
    Picture,
    PublisherId,
    CategoryId
)
VALUES
(   'TN01', 
    N'Con đi ngủ đúng giờ',
    N'Phúc Minh',
    10,  
    43000, 
    N'Con ngăn nắp chưa này! nằm trong bộ sách Rèn luyện kĩ năng trong sinh hoạt do Phuc Minh Book phát hành. Bộ sách sẽ mang đến cho các bé những bài học đầu tiên về kỹ năng sống tự lập, tự chăm sóc bản thân, giữ gìn vệ sinh, giúp đỡ người khác.Rèn luyện kỹ năng, xây dựng tính cách! Ba mẹ hãy cùng đồng cùng bé yêu với bộ 10 cuốn sách: Con sẽ ngủ đúng giờ, Con không sợ bác sĩ, Con thích đi học lắm, Ông trời lúc nắng lúc mưa, Nào cùng chơi thể thao, Con ngăn nắp chưa này, Con sang đường tai chưa?, Đi chơi nhớ cẩn thận, Sẵn sàng tới lớp nào, Ăn thế nào cho đủ? Với những hình ảnh minh họa vô cùng đáng yêu và bắt mắt, bộ sách này hứa hẹn sẽ trở thành những người bạn thân thiết trong quá trình cùng con trưởng thành.',
    N'con-di-ngu.jpg', 
    1,  
    1   
    ),
(   'TN02', 
    N'Chú chó đợi chờ',
    N'Hachiko',
    10,  
    47000, 
    N'Hachiko là một chú chó có thật từng sống ở Tokyo, được gia đình giáo sư Eisaburo Ueno nhận nuôi. Hàng ngày vào buổi sáng Hachiko tiễn giáo sư đến nhà ga Shibuya để ông lên tàu đi làm. Buổi chiều, vào lúc 3 giờ, Hachiko lại ra nhà ga đợi giáo sư về. Nhưng không may, một ngày nọ giáo sư Ueno đã qua đời sau một cơn đột quỵ và mãi mãi không thể trở về được nữa. Còn Hachiko suốt trong 10 năm sau đó, vào lúc 3 giờ chiều lại đều đặn đến nhà ga để chờ đón chủ nhân.',
    N'chu-cho-doi-cho.jpg', 
    1,  
    1   
    ),
(   'VH01', 
    N'Những Điều Xinh Đẹp Giống Như Em',
    N'Kim Jiyoung',
    10,  
    53000, 
    N'Nếu bạn đang băn khoăn liệu mình có đang thực sự hạnh phúc không, cuốn sách này sẽ giúp bạn dõng dạc tuyên bố với tất cả mọi người rằng: “Từ hôm nay, tôi quyết định sẽ sống thật hạnh phúc.”',
    N'nhung-dieu-xinh-dep-giong-nhu-em.jpg', 
    2,  
    2   
    ),
(   'VH02', 
    N'Ở Một Góc Nhân Gian',
    N'Hà Thương',
    10,  
    49000, 
    N'Thành phố này cũng giống chúng ta, không thể trở lại như cũNhững điều chúng ta tưởng rằng không thể chịu được, chúng ta đã chịu.Những thứ chúng ta tưởng rằng không thể đánh mất, đều đã mất hết.Có chăng giữ lại được, là hi vọng mong manh…',
    N'o-mot-goc-nhan-gian.jpg', 
    3,  
    2   
    ),
(   'KN01', 
    N'Harvard Bốn Rưỡi Sáng',
    N'Phan Thu Vân',
    10,  
    77000, 
    N'Harvard bốn rưỡi sáng sử dụng hình ảnh Harvard như một biểu tượng xuyên suốt, kể lại các câu chuyện có tính cách điệu về Harvard như một phương thức nhằm thu hút bạn đọc đến với cuốn sách, để từ đó chuyển tải những chỉ dẫn, khuyến khích, gợi ý cùng thông điệp vừa thực dụng vừa bay bổngtới các bạn trẻ đang ngồi trên ghế nhà trường và chuẩn bị bước vào đời. Có nhiềuthông điệp giá trị và hữu ích mà bạn sẽ học thu hoạch được từ cuốn sách như:',
    N'4ruoi-sang.jpg', 
    1,  
    3   
    ),
(   'KN02', 
    N'Nghĩ Đơn Giản, Sống Đơn Thuần',
    N'Nguyễn Viết Dương',
    10,  
    37000, 
    N'Từ xưa đến nay, chúng ta vẫn được định hướng để tin rằng chẳng có điều gì đáng giá mà không cần đấu tranh. Bản thân tôi cũng đã dành hàng thập kỷ để nghiên cứu về nhận định phổ biến này.',
    N'nghi-don-gian-song-don-thuan.jpg', 
    4,  
    3   
    ),
(   'KT01', 
    N'Từ Tốt Đến Vĩ Đại',
    N'Jim Collins',
    10,  
    68000, 
    N'Jim Collins cùng nhóm nghiên cứu đã miệt mài nghiên cứu những công ty có bước nhảy vọt và bền vững để rút ra những kết luận sát sườn, những yếu tố cần kíp để đưa công ty từ tốt đến vĩ đại. Đó là những yếu tố khả năng lãnh đạo, con người, văn hóa, kỷ luật, công nghệ… ',
    N'tu-tot-den-vi-dai.jpg', 
    4,  
    4   
    ),
(   'KT02', 
    N'Siêu Cò',
    N'HappyLive',
    10,  
    68000, 
    N'Một câu nói nổi tiếng trong tiếng Tây Ban Nha “Nói cho tôi biết bạn chơi với ai, và tôi sẽ nói cho bạn biết bạn là người thế nào” hay Người Việt cũng có rất nhiều câu nói tương tự: “Đi với bụt mặc áo cà sa, đi với ma mặc áo giấy”.',
    N'sieu-co.png', 
    5,  
    4   
    ),
(   'NN01', 
    N'Tự Học 2000 Từ Vựng Tiếng Anh',
    N'MCBOOKS',
    10,  
    38000, 
    N'Nghe nói đọc viết là 4 kĩ năng quan trọng để có thể học và sử dụng tốt tiếng Anh - ngôn ngữ toàn cầu. Tuy nhiên không phải ai cũng có thể thành thạo những kĩ năng này. Nghe hiểu là một trong những kĩ năng đòi hỏi sự tập trung và rèn luyện của người học.',
    N'200-tu-vung.jpg', 
    2,  
    5   
    ),
(   'NN02', 
    N'Cẩm Nang Cấu Trúc Tiếng Anh',
    N'Huy Hoàng',
    10,  
    65000, 
    N'Cuốn sách CẨM NANG CẤU TRÚC TIẾNG ANH gồm 25 phần, mỗi phần là một phạm trù kiến thức trong tiếng Anh được trình bày một cách ngắn gọn, đơn giản, cô đọng và hệ thống hoá dưới dạng sơ đồ, bảng biểu nhằm phát triển khả năng tư duy của người học và từ đó giúp người học nhớ kiến thức nhanh hơn và sâu hơn. Sau hầu hết các phần lí thuyết đều có 20-30 câu bài tập áp dụng để kiểm tra cũng như khắc sâu kiến thức cho người học. Tuy dày chưa đến 250 trang nhưng cuốn sách lại có thể bao trọn toàn bộ kiến thức từ đơn giản đến phức tạp cộng với cách tận dụng tối đa và áp dụng triệt để cách học tiếng Anh bằng sơ đồ tư duy.',
    N'cam-nang-tieng-anh.jpg', 
    3,  
    5   
    ),
(   'EB01', 
    N'Ăn Dặm Kiểu Nhật',
    N'Thái Hà',
    20,  
    77000, 
    N'Bạn đã làm cha mẹ. Và bạn có lúng túng với bước đầu cho bé yêu ăn dặm?',
    N'an-dam-kieu-nhat.jpg', 
    5,  
    6   
    ),
(   'EB02', 
    N'Để Con Được Ốm',
    N'Nhã Nam',
    20,  
    62000, 
    N'Để con được ốm có thể coi là một cuốn nhật ký học làm mẹ thông qua những câu chuyện từ trải nghiệm thực tế mà chị Uyên Bùi đã trải qua từ khi mang thai đến khi em bé chào đời và trở thành một cô bé khỏe mạnh, vui vẻ.',
    N'de-con-duoc-om.jpg', 
    1,  
    6   
    ),
(   'YH01', 
    N'Tạm Biệt Hội Chứng Ruột Kích Thích',
    N'Thái Hà',
    20,  
    61000, 
    N'Chia sẻ của tác giả Jinwon Lee về cuốn sách Tạm biệt hội chứng ruột kích thích: “Hội chứng ruột kích thích còn có nhiều tên gọi khác như hội chứng đại tràng mẫn cảm, viêm đại tràng co thắt hay rối loạn chức năng đại tràng. Nhưng tên chính thức của nó vẫn là hội chứng ruột kích thích. Tôi nghĩ rằng phần lớn những độc giả quan tâm đến cuốn sách này là những bệnh nhân mắc chứng ruột kích thích. Và tôi cũng nghĩ quý độc giả đều biết rằng cho dù có đến bệnh viện thì cũng không có gì thay đổi, bệnh nhân vẫn phải sống với hội chứng này cả đời và không có thuốc chữa dứt điểm',
    N'ho-trung-ruot-kich-thic.jpg', 
    1,  
    7   
    ),
(   'YH02', 
    N'Cơ Thể Tự Chữa Lành Giải Cứu Gan',
    N'Ngô Thế Vinh',
    20,  
    144000, 
    N'Cơ thể tự chữa lành - Giải cứu gan là cuốn sách tiếp theo trong bộ sách Cơ thể tự chữa lành của tác giả có sách bán chạy số 1 theo New York Times bình chọn: Anthony William. Trong tác phẩm mới này, ông sẽ hé mở bức màn bí mật về đặc điểm, cơ chế hoạt động và những điều bí ẩn xoay quanh lá gan của con người.',
    N'co-the-tu-chua-lanh.jpg', 
    1,  
    7   
    ),
(   'LS01', 
    N'Luận Về Đại Chiến Lược',
    N'Alphabooks',
    20,  
    154000, 
    N'Cuốn sách kinh điển này khám phá ý nghĩa của “đại chiến lược” bằng cách kể lại những quyết định mang tính định mệnh nhất và cả tồi tệ nhất trong lịch sử. Hầu hết những quyết định ấy đều liên quan đến các cuộc chinh phạt: cuộc xâm lược Hy Lạp của vua Ba Tư Xerxes năm 480 TCN, vua Philip II của Tây Ban Nha xâm lược Anh vào năm 1588, cuộc tấn công của Napoleon vào Nga năm 1812. Qua đây, Gaddis nêu bật sai lầm của việc tập trung vào “khát vọng vô hạn” mà phớt lờ “khả năng có hạn” của mỗi người.',
    N'luan-ve-dai-chen-luoc.jpg', 
    1,  
    8   
    ),
(   'LS02', 
    N'Leonardo Da Vinci',
    N'Nguyễn Thị Phương Lan',
    20,  
    510000, 
    N'Tác giả của các cuốn sách bán chạy nhất về Steve Jobs, Albert Einstein, và Benjamin Franklin sẽ đưa Leonardo trở lại với chúng ta trong cuốn tiểu sử vô cùng hấp dẫn này.',
    N'leonardo.jpg', 
    1,  
    8   
    ),
(   'CT01', 
    N'Những Anh Hùng Của Lịch Sử',
    N'Hoàng Đức Long',
    20,  
    166000, 
    N'Những anh hùng của lịch sử là một tác phẩm cho thấy rất rõ quan điểm của Durant về việc sử gia phải đồng thời là một triết gia. Ông nỗ lực nghiên cứu, nghiền ngẫm để truy tìm những viễn tượng triết học chứa đựng trong các sự kiện lịch sử, từ các vấn đề tôn giáo, chính trị tới xã hội, chẳng hạn như đấu tranh giai cấp và thậm chí cả cuộc tranh cãi có tính thời sự hơn, về tính khả dĩ của việc để người đồng tính làm việc trong quân đội.',
    N'anh-hung-cua-lich-su.jpg', 
    1,  
    9   
    ),
(   'CT02', 
    N'Chính Trị Học',
    N'Văn Hóa Sách Việt Nam',
    20,  
    176000, 
    N'Quyền lực nhà nước và kiểm soát quyền lực nhà nước là vấn đề vô cùng quan trọng, nhưng cũng rất phức tạp. Đối với mỗi nhà nước đương đại, việc xây dựng mô hình tổ chức, sử dụng và kiểm soát quyền lực nhà nước phù hợp sẽ là điều kiện để thực hiện hoạt động quản lý nhà nước đúng mục đích, đạt hiệu quả cao, bảo đảm được quyền và lợi ích chính đáng cho nhân dân – chủ thể cao nhất của quyền lực nhà nước, đây cũng chính là cơ sở để xây dựng đất nước phát triển bền vững.',
    N'chinh-tri-hoc.jpg', 
    1,  
    9   
    ),
(   'TL01', 
    N'Muốn An Được An',
    N'Thái Hà',
    20,  
    36000, 
    N'Ngày chủ nhật và cũng là ngày cuối cùng của tháng 11 năm 2014 tôi nhận được bản thảo cuốn sách Muốn an được an của thiền sư Thích Nhất Hạnh đã được sư cô Hội Nghiêm dịch ra tiếng Việt từ bản nguyên gốc tiếng anh Being peace. Tôi ngồi vào bàn rồi đọc ngay tức khắc..',
    N'muon-an-duoc-an.jpg', 
    1,  
    10   
    ),
(   'TL02', 
    N'Muôn Kiếp Nhân Sinh',
    N'First News - Trí Việt',
    20,  
    58000, 
    N'“Muôn kiếp nhân sinh” là tác phẩm do Giáo sư John Vũ - Nguyên Phong viết từ năm 2017 và hoàn tất đầu năm 2020 ghi lại những câu chuyện, trải nghiệm về tiền kiếp kỳ lạ từ nhiều kiếp sống trước đây của người bạn tâm giao lâu năm, ông Thomas – một nhà kinh doanh tài chính ở New York. Những câu chuyện chưa từng tiết lộ này sẽ giúp mọi người trên thế giới chiêm nghiệm, khám phá về các quy luật về luật Nhân quả và Nhân hồi của vũ trụ giữa lúc thế giới đang đang gặp nhiều cuộc khủng hoảng, trải qua nhiều biến động hằng ngày. ',
    N'muon-kiep-nhan-sinh.jpg', 
    1,  
    10   
    )
GO

	--- INSER DATA IN Account
	INSERT INTO dbo.Account
	(
	    AccountId,
	    UserName,
	    Password,
	    FullName,
	    Picture,
	    Email,
	    Address,
	    Phone,
	    IsAdmin,
	    Active
	)
	VALUES
	(   '844259FE-64C2-4EBF-9FD8-94F3B26FA63F',   -- AccountId - varchar(36)
	    'chungld',   -- UserName - varchar(64)
	    lower(CONVERT(VARCHAR(32), HashBytes('md5', 'chungld123456'), 2)),   -- Password - varchar(256)
	    N'Lại Đức Chung',  -- FullName - nvarchar(100)
	    'chungld.jpg',   -- Picture - varchar(512)
	    'chungld@bachkhoa-aptech.edu.vn',   -- Email - varchar(64)
	    N'238 Hoàng Quốc Việt Cầu Giấy Hà Nội',  -- Address - nvarchar(256)
	    '0339513657',   -- Phone - varchar(64)
	    1, -- IsAdmin - bit
	    1  -- Active - bit
	    ),
		('BE8922F0-713A-471B-A91F-4DD543F828D6',   -- AccountId - varchar(36)
	    'haibt',   -- UserName - varchar(64)
	    lower(CONVERT(VARCHAR(32), HashBytes('md5', 'haibt123456'), 2)),   -- Password - varchar(256)
	    N'Bùi Thanh Hải',  -- FullName - nvarchar(100)
	    'haibt.jpg',   -- Picture - varchar(512)
	    'haibt@bachkhoa-aptech.edu.vn',   -- Email - varchar(64)
	    N'Hà Đông-Hà Nội',  -- Address - nvarchar(256)
	    '0339513658',   -- Phone - varchar(64)
	    0, -- IsAdmin - bit
	    1  -- Active - bit
	    ),
		('65DEA567-C705-4F59-9AF9-18E413D824C7',   -- AccountId - varchar(36)
	    'trungbd',   -- UserName - varchar(64)
	    lower(CONVERT(VARCHAR(32), HashBytes('md5', 'trungbd123456'), 2)),   -- Password - varchar(256)
	    N'Bùi Đức Trung',  -- FullName - nvarchar(100)
	    'trungbd.jpg',   -- Picture - varchar(512)
	    'trungbd@bachkhoa-aptech.edu.vn',   -- Email - varchar(64)
	    N'Dân Chủ Hưng Hà Thái Bình',  -- Address - nvarchar(256)
	    '0339513659',   -- Phone - varchar(64)
	    0, -- IsAdmin - bit
	    1  -- Active - bit
	    ),
		('E3BB43BC-12ED-451D-80D8-7D03CE674665',   -- AccountId - varchar(36)
	    'luongna',   -- UserName - varchar(64)
	    lower(CONVERT(VARCHAR(32), HashBytes('md5', 'luongna123456'), 2)),   -- Password - varchar(256)
	    N'Nguyễn Anh Lương',  -- FullName - nvarchar(100)
	    'luongna.jpg',   -- Picture - varchar(512)
	    'luongna@bachkhoa-aptech.edu.vn',   -- Email - varchar(64)
	    N'Đô Lương Nghệ An',  -- Address - nvarchar(256)
	    '0339513656',   -- Phone - varchar(64)
	    0, -- IsAdmin - bit
	    1  -- Active - bit
	    )
GO

--Insert data in orderbook
INSERT INTO dbo.OrderBook
(
    OrderId,
    OrderDate,
    AccountId,
    ReceiveAddress,
	ReceivePhone,
    Note,
    Status
)
VALUES
(   'HD01',        -- OrderId - varchar(16)
    GETDATE(), -- OrderDate - datetime
    '65DEA567-C705-4F59-9AF9-18E413D824C7',        -- AccountId - varchar(36)
    N'336 Hoàng Quốc Việt Cầu Giấy Hà Nội',       -- ReceiveAddress - nvarchar(512)
	'',       --ReceivePhone - nvarchar(512)
    N'',       -- Note - nvarchar(512)
    NULL       -- Status - bit
    ),
(   'HD02',        -- OrderId - varchar(16)
    GETDATE(), -- OrderDate - datetime
    'E3BB43BC-12ED-451D-80D8-7D03CE674665',        -- AccountId - varchar(36)
    N'18 Hoàng Như Tiếp Long Biên Hà Nội',       -- ReceiveAddress - nvarchar(512)
	'',       --ReceivePhone - nvarchar(512)
    N'',       -- Note - nvarchar(512)
    NULL       -- Status - bit
    ),
(   'HD03',        -- OrderId - varchar(16)
    GETDATE(), -- OrderDate - datetime
    'E3BB43BC-12ED-451D-80D8-7D03CE674665',        -- AccountId - varchar(36)
    N'39 Hồ Tùng Mậu Cầu Giấy Hà Nội',       -- ReceiveAddress - nvarchar(512)
	'',       --ReceivePhone - nvarchar(512)
    N'',       -- Note - nvarchar(512)
    NULL       -- Status - bit
    )
GO

--INSERT DATA IN OrderDetail
select * from OrderDetail
INSERT INTO dbo.OrderDetail
(
    OrderId,
    BookId,
    Quantity,
    Price
)
VALUES
(     -- OrderDetailId - int
    'HD01', -- OrderId - varchar(16)
    'CT01', -- BookId - varchar(10)
    1,  -- Quantity - int
    166000 -- Price - float
    ),
	(     -- OrderDetailId - int
    'HD01', -- OrderId - varchar(16)
    'CT02', -- BookId - varchar(10)
    1,  -- Quantity - int
    176000 -- Price - float
    ),
	(    -- OrderDetailId - int
    'HD02', -- OrderId - varchar(16)
    'CT02', -- BookId - varchar(10)
    1,  -- Quantity - int
    176000 -- Price - float
    ),
	(     -- OrderDetailId - int
    'HD03', -- OrderId - varchar(16)
    'CT01', -- BookId - varchar(10)
    1,  -- Quantity - int
    166000 -- Price - float
    )
