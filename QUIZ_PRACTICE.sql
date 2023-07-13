CREATE DATABASE QUIZ_PRACTICE
GO
USE QUIZ_PRACTICE
GO


	
/**********************************************************
**********************************************************/

----  Create table Admin ----
CREATE TABLE [Admin] (
	[admin_id] [int] PRIMARY KEY not null ,
	[email] [nvarchar] (250) not null,
	[password] [nvarchar] (250) not null
)


----  Create table Role ----
CREATE TABLE [Role] (
	[role_id] [int] PRIMARY KEY not null ,
	[role_name] [nvarchar] (250) not null,
)


---- Create table User ----
CREATE TABLE [User_type] (
	[user_id] [int] IDENTITY (1,1) PRIMARY KEY not null,
	[email] [nvarchar] (250) not null,
	[password] [nvarchar] (250) not null,
	[describe_yourself] [nvarchar] (MAX),
	[fullname] [nvarchar] (250) not null,
	[image] [nvarchar] (250),
	[display_name] [nvarchar] (250),
	[created_date] [nvarchar] (250) default getdate(),
	[address] [nvarchar] (250),
	[date_of_birth] [nvarchar] (250),
	[academic_level] [nvarchar] (250),
	[modify_date] [nvarchar] (250),
	[gender] [int] NOT NULL CHECK (gender IN (0, 1)),
	[role_id] [int] FOREIGN KEY REFERENCES [Role]([role_id]),
)


---- Create table Subject -----
CREATE TABLE [Subject] (
	[subject_id] [int] IDENTITY (1,1) PRIMARY KEY not null,
	[subject_name] [nvarchar] (250) not null,
	[image] [nvarchar] (250),
	-----Add-------
	[title] [nvarchar] (max),
	[status] [BIT] not null DEFAULT 0,
	[description] [nvarchar] (max)
)

----------------------------------add

--add slider ket noi voi subject
CREATE TABLE Slider (
 [slider_id] [int] IDENTITY (1,1) PRIMARY KEY not null,
 [subject_id] [int] FOREIGN KEY REFERENCES [Subject]([subject_id]) ,
 [slider_url] [varchar] (max),
 [content] [nvarchar] (max),
 [note] [nvarchar] (max),
 [isShow] BIT not null DEFAULT 0
)

---- Create table Mentor ----
CREATE TABLE [Mentor_type] (
	[mentor_id] [int] IDENTITY (1,1) PRIMARY KEY not null,
	[email] [nvarchar] (250) not null,
	[password] [nvarchar] (250) not null,
	[describe_yourself] [nvarchar] (MAX),
	[fullname] [nvarchar] (250) not null,
	[image] [nvarchar] (250),
	[display_name] [nvarchar] (250),
	[created_date] [nvarchar] (250) default getdate(),
	[address] [nvarchar] (250),
	[date_of_birth] [nvarchar] (250),
	[academic_level] [nvarchar] (250),
	[modify_date] [nvarchar] (250),
	[gender] [int] NOT NULL CHECK (gender IN (0, 1)),
	[specialize] [nvarchar] (MAX),
	[role_id] [int] FOREIGN KEY REFERENCES [Role]([role_id]),
)


----- Create table Course ------
CREATE TABLE [Course] (
	[course_id] [int] IDENTITY (1,1) PRIMARY KEY not null,
	[subject_id] [int] not null FOREIGN KEY REFERENCES [Subject]([subject_id]),
	[mentor_id] [int] FOREIGN KEY REFERENCES [Mentor_type]([mentor_id]) default null,
	[course_name] [nvarchar] (250) not null,
	[description] [nvarchar] (max),
	[image] [nvarchar] (250) not null,
	[is_publish] [int],
	[quantity] [int] default 0,
	[created_date] [nvarchar] (250) default (getdate()),
	[updated_date] [nvarchar] (250),
)

---- Create table Errol ----
CREATE TABLE [Errol] (
	[user_id] [int] not null FOREIGN KEY REFERENCES [User_type]([user_id]),
	[course_id] [int] not null FOREIGN KEY REFERENCES [Course]([course_id]),
	[erroled_date] [date] default (getdate()),
	PRIMARY KEY ([user_id], [course_id])
)

--- Create table ResultTest ----
CREATE TABLE [Result_test] (
	[user_id] [int] not null FOREIGN KEY REFERENCES [User_type]([user_id]),
	[course_id] [int] not null FOREIGN KEY REFERENCES [Course]([course_id]),
	[status] [nvarchar] (250) not null,
	[score] [int] not null,
	PRIMARY KEY ([user_id], [course_id])
)

---- Create table Question ----
CREATE TABLE [Question] (
	[question_id] [int] IDENTITY (1,1) not null PRIMARY KEY,
	[question_name] [nvarchar] (250) not null,
	[course_id] [int] not null FOREIGN KEY REFERENCES [Course]([course_id]) 
)

CREATE TABLE [Exam_details] (
	[user_id] [int] not null FOREIGN KEY REFERENCES [User_type]([user_id]),
	[course_id] [int] not null FOREIGN KEY REFERENCES [Course]([course_id]),
	[question_id] [int] not null FOREIGN KEY REFERENCES [Question]([question_id]),
	[answer_choose] [int] not null,
	PRIMARY KEY ([user_id], [course_id], [question_id])
)

---- Create table Answer -----
CREATE TABLE [Answer] (
	[answer_id] [int] IDENTITY (1,1) not null PRIMARY KEY,
	[answer_name] [nvarchar] (max) not null,
	[is_correct] [int] not null, ---nhận giá trị 0 và 1( 0: sai , 1: đúng)
	[question_id] [int] not null FOREIGN KEY REFERENCES [Question]([question_id])
)


---- Create table Marketer ------
CREATE TABLE [Marketer_type] (
	[marketer_id] [int] IDENTITY (1,1) PRIMARY KEY not null,
	[email] [nvarchar] (250) not null,
	[password] [nvarchar] (250) not null,
	[describe_yourself] [nvarchar] (MAX),
	[fullname] [nvarchar] (250) not null,
	[image] [nvarchar] (250),
	[display_name] [nvarchar] (250),
	[created_date] [nvarchar] (250) default getdate(),
	[address] [nvarchar] (250),
	[date_of_birth] [nvarchar] (250),
	[academic_level] [nvarchar] (250),
	[modify_date] [nvarchar] (250),
	[gender] [int] NOT NULL CHECK (gender IN (0, 1)),
	[role_id] [int] FOREIGN KEY REFERENCES [Role]([role_id]),
)

---------------------------------------------------------------add

---- Create table Blog ------(List_marketing )
--DROP TABLE [List_marketing]
CREATE TABLE Blog (
	[blog_id] [int] IDENTITY (1,1) PRIMARY KEY not null,
	blog_name nvarchar(255) not null,
)

---- Create table Post -----(Marketing)
-- DROP TABLE [Marketing]
CREATE TABLE Post (
	[post_id] [int] IDENTITY (1,1) PRIMARY KEY not null,
	[marketer_id] [int] not null FOREIGN KEY REFERENCES [Marketer_type]([marketer_id]),
	[subject_id] [int] FOREIGN KEY REFERENCES [Subject]([subject_id]),
	[blog_id] [int] not null FOREIGN KEY REFERENCES Blog([blog_id]),
	[tittle] [nvarchar] (max) not null,
	[posted_date] [date] default getdate(),
	[updated_date] [date],
	[image] [nvarchar] (250) not null,
	[content] [nvarchar] (max) not null,
	[short_content] [nvarchar] (250) not null,
	[status] [NVARCHAR] (20) DEFAULT 'pending',
	
)
---------------------------------------------------------------add
--add role	
INSERT INTO Role(role_id,role_name) VALUES(1,'admin')
INSERT INTO Role(role_id,role_name) VALUES(2,'mentor')
INSERT INTO Role(role_id,role_name) VALUES(3,'marketer')
INSERT INTO Role(role_id,role_name) VALUES(4,'user')

--add admin
insert into [Admin] values (1, 'tuanvm@gmail.com', '12345678')

--add user
INSERT INTO [dbo].[User_type]
           ([email] ,[password],[fullname],[display_name],[address],[date_of_birth],[gender],[role_id])
     VALUES
           ('ngohuunam2002@gmail.com','123456789','Ngo Huu Nam','NamNH',N'Việt Nam','2002-10-01',1,4)


INSERT INTO [dbo].[User_type]
           ([email] ,[password],[fullname],[display_name],[address],[date_of_birth],[gender],[role_id])
     VALUES
           ('nguyenvana@gmail.com','123456','Nguyen Van A','VanANguyen',N'Việt Nam','1999-10-01',1,4)


--add markerter
INSERT INTO [dbo].[Marketer_type]
           ([email] ,[password],[fullname],[display_name],[address],[date_of_birth],[gender],[role_id])
     VALUES
           ('TranThiB@gmail.com','12345','Tran Thi B','BTran',N'Việt Nam','1998-01-01',0,3)



--add mentor
SELECT * FROM [Mentor_type]

INSERT INTO [dbo].[Mentor_type]
           ([email] ,[password],[fullname],[display_name],[address],[date_of_birth],[gender],[role_id])
     VALUES
           ('TranQuyBan@gmail.com','12345','BanKelly','QuyTran',N'Việt Nam','1990-01-01',0,2)
	
insert into [Subject] ([subject_name], [image], [status], [title], [description]) 
					  values ('C', './assets/images/categories/C.png', 1, N'C - Ngôn ngữ cơ bản cho người mới bắt đầu', N'Hiểu và áp dụng những kiến thức nền tảng cần thiết cho developer'),
							 ('C++', './assets/images/categories/C++.png',1, N'C++ - Ngôn ngữ cơ bản cho người mới bắt đầu', N'Hiểu và áp dụng những kiến thức nền tảng cần thiết cho developer'),
							 ('C#', './assets/images/categories/CSharp.png' ,1, N'C# - Ngôn ngữ cơ bản cho người mới bắt đầu', N'Hiểu và áp dụng những kiến thức nền tảng cần thiết cho developer'),
							 ('Java', './assets/images/categories/Java.png',1, N'Java - Ngôn ngữ cơ bản cho người mới bắt đầu', N'Hiểu và áp dụng những kiến thức nền tảng cần thiết cho developer'),
							 ('Javascript', './assets/images/categories/Javascript.png',1, N'Javascript - Ngôn ngữ cơ bản cho người mới bắt đầu', N'Hiểu và áp dụng những kiến thức nền tảng cần thiết cho developer'),
							 ('Python', './assets/images/categories/Python.png',1, N'Python - Ngôn ngữ cơ bản cho người mới bắt đầu', N'Hiểu và áp dụng những kiến thức nền tảng cần thiết cho developer')

insert into [Course]([subject_id], [course_name], [description], [image], [is_publish], [created_date]) values (1, N'Khóa học C cơ bản cho người mới bắt đầu', N'Khóa học C cơ bản giúp các bạn nắm chắc những kiến thức cơ bản của lập trình nói chung và lập trình C nói riêng để các bạn có nền tảng vững chắc để chinh phục con đường trở thành một lập trình viên', './assets/images/categories/CourseC(1).png', 0, '24/05/2023'),
													       (1, N'Lập trình C từ cơ bản đến nâng cao', N'Khóa học lập trình C từ cơ bản tới nâng cao dành cho người mới bắt đầu. Mục tiêu của khóa học này nhằm giúp các bạn nắm được các khái niệm căn cơ của lập trình, giúp các bạn có nền tảng vững chắc để chinh phục con đường trở thành một lập trình viên.', './assets/images/categories/CourseC(2).png', 0, '24/05/2023')

insert into [Question] values ('In C, correct order(s) of a function implementation. Choose at least one answer.', 1), ---- 1 ----
							  ('The while loop can be written as a for loop', 1), ---- 2 ----
							  ('Using break statement we can exit from', 1), ---- 3 ----
							  ('Declare a two dimensional integer array of two rows and four columns having some initial values', 1), ---- 4 ----
							  ('What number is equivalent to -4e3?', 1), ---- 5 ----
							  ('Which of the following statement are true with regards to the || operator?(select al correct answer', 2), ---- 6 ----
							  ('Which one of the following is a variable, which can contain the address of the memory location of another variable?(choose the best answer)', 2), ---- 7 ----
							  ('How is a variable accessed from another file?', 2), ---- 8 ----
							  ('Which option is correct about the function scanf?', 2), ---- 9 ----
							  ('What value will x contain in the sample code below? int x=011|0x10;', 2)  ---- 10 ----

insert into [Answer] values ('a. Return type, body, function name, parameters', 0, 1),
						    ('b. Return type, body, parameters, function name', 0, 1),
							('c. Return type, function name, parameters, body', 1, 1),
							('d. Return type, parameters, body, function name', 0, 1),
							('a. True', 1, 2),
							('b. False', 0, 2),
							('a. for a loop', 1, 3),
							('b. an if statement', 0, 3),
							('c. the main() function', 0, 3),
							('d. a program', 0, 3),
							('a.int arr1[4][2]={{8,12},{22,45},{23,40},{44,79}}', 0, 4),
							('b.int arr1[2][4]={{8,12},{22,45},{23,40},{44,79}}', 1, 4),
							('c.int arr1[4][2]={{8,12};{22,45};{23,40};{44,79}}', 0, 4),
							('d.int arr1[][2]={{8,12},{22,45},{23,40},{44,79}}', 0, 4),
							('a. -4000', 1, 5),
							('b. -400', 0, 5),
							('c. .004', 0, 5),
							('d. .0004', 0, 5),
							('a. Computers store floating-point data using separate components, including the mantissa and exponent', 0, 6),
							('b.Float-point means that the decimal point can float(that is, it can ba placed anywhere relative to the significant digits)', 1, 6),
							('c.Both data types(float and double) can represent arbitrarily small as well as arbitrarily large numbers', 0, 6),
							('d.None of the above', 0, 6),
							('a.String', 0, 7),
							('b.Struct', 1, 7),
							('c.Array', 0, 7),
							('d.Pointer', 0, 7),
							('a. The global variable is referenced via the auto specifier', 0, 8),
							('b. The global variable is referenced via the extern specifier', 1, 8),
							('c. The global variable is referenced via the pointer specifier', 0, 8),
							('d. The global variable is referenced via the ext specifie', 0, 8),
							('e. The global variable is referenced via the global specifier', 0, 8),
							('a. EOF indicates that scanf filled all addresses successfully', 0, 9),
							('b. Scanf returns the number of addresses successfully filled of EOF', 1, 9),
							('c.Return avoid type', 0, 9),
							('a.27', 0, 10),
							('b.19', 0, 10),
							('c.25', 1, 10),
							('d.13', 0, 10),
							('e.3', 0, 10)

--------------------------------insert into Blog-Post-slider

GO

INSERT INTO [dbo].[Blog]([blog_name])VALUES(N'Engineering and Technology');
INSERT INTO [dbo].[Blog]([blog_name])VALUES(N'Math');
INSERT INTO [dbo].[Blog]([blog_name])VALUES(N'Sociology');
INSERT INTO [dbo].[Blog]([blog_name])VALUES(N'Art');
INSERT INTO [dbo].[Blog]([blog_name])VALUES(N'Business and Management');
INSERT INTO [dbo].[Blog]([blog_name])VALUES(N'General Medicine');

--DELETE FROM Post

INSERT INTO [dbo].[Post]([marketer_id],[blog_id],[subject_id],[tittle],[image],[content],[short_content],[status])VALUES
           (1,1,1,'What is language program C?','313920073_510188231031083_8451312006797281979_n.jpg',N'The C programming language is an imperative language developed in the early 1970s by Dennis Ritchie for use in the UNIX operating system.  Since then, this language has spread to many other operating systems and has become one of the most popular languages.  C is the most efficient and preferred language for writing system software, although it is also used for writing applications.  In addition, C is also often used as a teaching medium in computer science, although the language is not designed for beginners.<br>
		   There are many different identifiers used in the programming industry.  In particular, the GANSIC and C99 languages ​​have distinct advantages.  They are determined through different criteria of the system the right person is using.  Each version will help users to be more flexible and develop.  But in reality, they are all C Languages. improved features in phases over time.<br>
		    In the early 70s at Bell Laboratories, Dennis Ritchie developed breast language.  C was first used on a household in the UNIX operating system land.  C is derived from the BCPL language developed by Martin Richards.  BCPL was then developed into B language by Ken Thompson, this is the originator of C. This is a C programming language in the period 1972 - 1989','The C programming language is an imperative language developed in the early 1970s by Dennis Ritchie for use in the UNIX operating system.','approved');
GO

INSERT INTO [dbo].[Post]([marketer_id],[blog_id],[subject_id],[tittle],[image],[content],[short_content],[status])VALUES(1,1,2,'What is C++ programming language?','313920073_510188231031083_8451312006797281979_n.jpg',N'<p>In 1979, C++ was developed by Bjarne Stroustrup at Bell Labs based on the C language. C++ (C plus plus) means an extension of C. Unlike C, C++ was improved to become an object-oriented programming language.</p>
<p><strong>Features of C++</strong></p>
<ul><li style="list-style-type: none;"><ul><li><strong data-rich-text-format-boundary="true">Very strong and flexible</strong>: capable of expressing any idea.</li><li><strong>Widely used</strong> by professional programmers.</li><li><strong>Portability</strong>: little change on different computer systems.</li><li><strong>Clear, succinct</strong>.</li><li><strong>monial programming</strong>: reuse through functions.</li><li><strong>Structure</strong>: structured blocks of code.</li><li ><strong>Object Oriented</strong>.</li></ul></li></ul>
','In 1979, C++ was developed by Bjarne Stroustrup at Bell Labs based on the C language.','approved')


INSERT INTO [dbo].[Post]([marketer_id],[blog_id],[subject_id],[tittle],[image],[content],[short_content],[status])VALUES(1,1,3,'What is C#? Learn about C# programming language','313920073_510188231031083_8451312006797281979_n.jpg',N'<h2 ><strong>What is C#?</strong></h2><p>C# (or C sharp) is a simple programming language, developed by Microsoft engineers in 2000. C# is modern, object-oriented programming language built on the foundation of two of the most powerful languages, C++ and Java.</p>
<p>In traditional Windows applications, the program source code is compiled directly into the operating system''s executable code.<br> In applications using the .NET Framework, the program source code (C#, VB) .NET) is compiled into MSIL (Microsoft intermediate language) code.</p>
<p>This code is then compiled by the Common Language Runtime (CLR) to become the operating system ''s executable code. The figure below shows the process of converting MSIL code to native code.</p>
<p id="yui_3_17_2_1_1593403648852_26">C# with strong support of .NET Framework makes creating a Windows Forms or WPF (Windows Presentation Foundation) application, game development, Web application, Mobile application very easy easy.</p>','C# (or C sharp) is a simple programming language, developed by Microsoft engineers in 2000','approved')


INSERT INTO [dbo].[Post]([marketer_id],[blog_id],[subject_id],[tittle],[image],[content],[short_content],[status])VALUES(1,1,4,'What is Java programming language? How important is Java?','313920073_510188231031083_8451312006797281979_n.jpg',N'<p style="text-align: justify;"><strong>Đối với những ITer hay những bạn theo học chuyên ngành về Công nghệ thông tin thì không có ai là không biết tới ngôn ngữ lập trình Java. Đối với những bạn có đam mê và đang tìm hiểu về lĩnh vực này thì việc tìm hiểu kỹ “Ngôn ngữ lập trình Java là gì? Java quan trọng như thế nào?” là điều rất cần thiết.</strong></p>
<p style="text-align: justify;"><strong _msttexthash="165386" _msthash="772">What is Java?</strong></p><p style="text-align: justify;" _msttexthash="59275450" _msthash="773">Java is a programming language that produces software for multiple platforms. An application in the Java language can run on most operating systems such as Windows, Linux, Solaris, and Mac OS. Java was released in 1995 by James A. Gosling, a former Sun Microsystems computer scientist. You can download the latest Java version for free at java.com.</p>
<p style="text-align: justify;" _msttexthash="19081257" _msthash="775">The biggest difference between Java and other programming languages is that Java can perform many tasks that you only need to set them to run once. They are fast, accurate, safe to set up and use.</p>
<p style="text-align: justify;" _msttexthash="41324881" _msthash="776">Once downloaded, you use it to write and run Java code right on your computer. And now you''ll see the difference in that the commands you write and run will work on most desktops, laptops, mobile phones, tablets and other devices without you having to rewrite or modify the original code.</p>
<p style="text-align: justify;"><strong _msttexthash="402285" _msthash="777">How important is Java?</strong></p><p style="text-align: justify;" _msttexthash="139536904" _msthash="778">Most applications on phones or websites will not be able to run if programmers do not use Java and set it up and create it regularly. The electronics around you all have Java. Even to the device that you are using to read this article, desktop, laptop, mobile phone, tablet, TV, ATM, music player, printer, Internet, ... most of the things with data use the Java programming language. According to statistics, most enterprise desktops operate using the Java programming language and it is present in nearly every smartphone in the world.</p>
<p style="text-align: justify;" _msttexthash="31864508" _msthash="780">To date, Java represents the most complete object-oriented programming language. In addition to being able to combine the syntax and components of the C and C++ languages, Java has advanced its functionality to support an object-oriented approach.</p>
<p style="text-align: justify;" _msttexthash="127695282" _msthash="781">Since the 1990s, Java has remained important to the field of Information Technology and its influence in programming languages. Employers always prioritize and care about candidates who are proficient in this language in all IT skills of a programmer. Java always accompanies and develops with the most advanced technology in electronic devices such as mainframes, virtual reality technology, phablets, dumb phones, smart phones, e-readers, netbooks, air traffic control systems, routers, robots, ...</p>
<p style="text-align: justify;" _msttexthash="70443399" _msthash="782"><em _istranslated="1">Through this article, you can understand <strong _istranslated="1">what Java Programming Language is</strong></em><em _istranslated="1">. </em><strong _istranslated="1"><em _istranslated="1">How important is Java? </em></strong> <em _istranslated="1">So those of you who are passionate about Information Technology, especially programming, learning firmly and proficiently writing and running Java is a really necessary thing. You can completely expand your career opportunities and salary if you are good at this skill. </em></p>
','For ITers or those who major in Information Technology, there is no one who does not know the Java programming language.','approved')


INSERT INTO [dbo].[Post]([marketer_id],[blog_id],[subject_id],[tittle],[image],[content],[short_content],[status])VALUES(1,1,5,'What is JavaScript?','313920073_510188231031083_8451312006797281979_n.jpg',N'<p _msttexthash="11665030" _msthash="26"><strong _istranslated="1">JavaScript</strong> has been the most popular programming language in the world for the past 20 years. It is also one of the 3 main languages of web programming:</p>
<ol>
<li _msttexthash="1257126" _msthash="27"><a href="https://www.hostinger.vn/huong-dan/html-cheat-sheet-co-html5-tags-moi/" target="_blank" rel="noopener follow" data-wpel-link="internal" _istranslated="1">HTML</a>: Helps you add content to your website.</li>
<li _msttexthash="2545426" _msthash="28"><a href="https://www.hostinger.vn/huong-dan/khac-biet-giua-inline-external-va-internal-style-css" target="_blank" rel="noopener follow" data-wpel-link="internal" _istranslated="1">CSS</a>: Design formatting, layout, style, alignment of the web page.</li>
<li _msttexthash="1595568" _msthash="29">JavaScript: Improves the way your website works.</li>
</ol>
<p _msttexthash="47822580" _msthash="30">JavaScript can be <a href="https://www.bitdegree.org/learn/javascript-basics/" data-wpel-link="external" target="_blank" rel="nofollow external noopener noreferrer" _istranslated="1">learned quickly</a> and easily applied for a variety of purposes, from improving website functionality to running games and creating web-based software. Furthermore, there are thousands of JavaScript templates and apps out there, thanks to the community''s dedication, especially Github.</p>',N'JavaScript has been the most popular programming language in the world for the past 20 years.','approved')

INSERT INTO [dbo].[Post]([marketer_id],[blog_id],[subject_id],[tittle],[image],[content],[short_content],[status])VALUES(1,1,6,'What is Python?','313920073_510188231031083_8451312006797281979_n.jpg','<p _msttexthash="49509226" _msthash="90">First, what is Python? Python is a <a href="https://glints.com/vn/blog/ngon-ngu-lap-trinh-bac-cao/" target="_blank" rel="noreferrer noopener" _istranslated="1">high-level computer programming language</a> commonly used to build websites and software, automate tasks, and conduct <a href="https://glints.com/vn/blog/ky-nang-phan-tich-du-lieu/" target="_blank" rel="noreferrer noopener" _istranslated="1">data analysis</a>. Python is a general-purpose language, meaning it can be used to create many different and non-specialized programs for any particular problem. </p>
<p _msttexthash="36014537" _msthash="93">This versatility, coupled with its beginner-friendliness, has made it one of the most used programming languages today. A survey conducted by industry analytics firm RedMonk found that it was the second most popular programming language among <a href="https://glints.com/vn/blog/developer-la-gi/" target="_blank" rel="noreferrer noopener" _istranslated="1">developers</a> in <a href="https://redmonk.com/sogrady/2021/08/05/language-rankings-6-21/" target="_blank" rel="noreferrer noopener" _istranslated="1">2021</a>.</p>
<h2 class="wp-block-heading" id="h-một-vai-sự-thật-thu-vị-về-python"><span class="ez-toc-section" id="mot_vai_su_that_thu_vi_ve_python" ez-toc-data-id="#mot_vai_su_that_thu_vi_ve_python"></span><strong _msttexthash="950638" _msthash="94">A few interesting facts about Python</strong><span class="ez-toc-section-end"></span></h2>
<p _msttexthash="3369535" _msthash="95">Let''s take a look at a few interesting facts about this language with Glints:</p>
<ul>
<li _msttexthash="28195206" _msthash="96">Python was developed in the late 1980s by Guido van Rossum at the National Research Institute of Mathematics and Computer Science in the Netherlands as the successor to the ABC language capable of exception handling and communication.</li>



<li _msttexthash="4121819" _msthash="97">Python is derived from programming languages such as ABC, Modula 3, small talk, Algol-68.</li>



<li _msttexthash="5163587" _msthash="98">Van Rossum chose the Python name for the new language from a TV show, Monty Python''s Flying Circus.</li>



<li _msttexthash="5320172" _msthash="99">A Python page is a file with a .py extension that can be a combination of HTML Tags and Python scripts.</li>



<li _msttexthash="12425699" _msthash="100">In December 12, the creator developed the first python interpreter as a hobby, and then on October 1989, 16, Python 10.2000 was released with many new features.</li>



<li _msttexthash="4430985" _msthash="101">On December 3, 12, Python 2008.3 was released with more testing and included new features.</li>



<li _msttexthash="1359332" _msthash="102">Python is an open-source scripting language.</li>



<li _msttexthash="18901051" _msthash="103">Python is open source, which means that anyone can download it for free from <a href="http://www.python.org" _istranslated="1">the homepage</a> and use it to develop programs. Its source code can be accessed and modified as required in the project.</li>



<li _msttexthash="1534221" _msthash="104">Python is one of the official languages at Google.</li>
</ul>','Python is a high-level computer programming language commonly used to build websites and software, automate tasks, and conduct data analysis.','approved')

--tao 5 slider(c,java,python,C#,javaScript)


INSERT INTO [dbo].[Slider]([slider_url],[content],[isShow],[subject_id])
     VALUES('1.png','C language quiz now',1,1)
INSERT INTO [dbo].[Slider]([slider_url],[content],[isShow],[subject_id])
     VALUES('2.png','C++ language quiz now',1,2)
INSERT INTO [dbo].[Slider]([slider_url],[content],[isShow],[subject_id])
     VALUES('3.png','C# language quiz now',1,3)
INSERT INTO [dbo].[Slider]([slider_url],[content],[isShow],[subject_id])
     VALUES('4.png','Java language quiz now',1,4)
INSERT INTO [dbo].[Slider]([slider_url],[content],[isShow],[subject_id])
     VALUES('5.png','Javascript language quiz now',1,5)
INSERT INTO [dbo].[Slider]([slider_url],[content],[isShow],[subject_id])
     VALUES('6.png','Python language quiz now',1,6)
GO

--trigger rằng buộc khi insert hoặc update status phải là 1 trong 3 cái kia
CREATE TRIGGER CheckStatusTrigger
ON Post
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT *
        FROM inserted
        WHERE status NOT IN ('pending', 'approved', 'rejected')
    )
    BEGIN
        RAISERROR ('Invalid status value. Allowed values are "pending", "approved", or "rejected".', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
