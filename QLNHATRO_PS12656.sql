create database QLNHATRO_PS12656
go
use QLNHATRO_PS12656

create table LOAINHA 
(
MaLoaiNha  int primary key not null identity(1,1),
TenLoaiNha nvarchar(100) ,
ThongTin nvarchar(100)
);

create table NGUOIDUNG 
(
Mand int primary key not null identity(1,1),
Tennd nvarchar(50) ,
GioiTinh bit,
DienThoai char(15),
DiaChi nvarchar(100),
Quan nvarchar(20),
Email varchar(50)
);

create table NHATRO
(
MaNha int primary key not null identity(1,1),
MaLNha int,
DienTich real check (DienTich>=0) ,
GiaPhong  money check(GiaPhong>=0),
DiaChi nvarchar(100),
Quan nvarchar(20),
ThongTin nvarchar(50),
NgayDang date,
NguoiLienHe int
);

create table DANHGIA
(
MaNhaTro int,
MaDanhGia int,
DanhGia bit,
NoiDung nvarchar(100)
primary key (MaNhaTro,MaDanhGia)
);

alter table nhatro
add constraint fk_nhatro_loainha foreign key (MaLNha) references loainha(MaLoaiNha),
constraint fk_nhatro_nguoidung foreign key (NguoiLienHe) references nguoidung(mand)

alter table danhgia
add constraint fk_danhgia_nguoidung foreign key (MaDanhGia) references nguoidung(MaNd),
constraint fk_danhgia_nhatro foreign key (MaNhaTro) references NhaTro(maNha)


insert into LOAINHA values
(N'Căn Hộ Chung Cư',N'Nhà thoáng mát rộng rãi, có nội thất'),
(N'Nhà Trọ',N'Nhà trọ giá rẻ, lợp lí cho sinh viên'),
(N'Nhà Riêng',N'Nhà thoáng mát rộng rãi, có nội thất'),
(N'Căn hộ khép kín',N'Có nhà xe, nội thất đầy đủ')


select * from LOAINHA


--  1. Thêm thông tin vào các bảng

--SP thứ nhất thực hiện chèn dữ liệu vào bảng NGUOIDUNG
if OBJECT_ID ('sp_insert_nguoidung') is not null
drop proc sp_insert_nguoidung
go
create proc sp_insert_nguoidung
	@TenNd nvarchar(50) = null,
	@GioiTinh bit = null,
	@Sdt char(15)= null,
	@DiaChi nvarchar(50)=null,
	@quan nvarchar(30)= null,
	@Email char(50) = null
as
if(@TenNd is null) or(@GioiTinh	is null) 
  or(@Sdt is null ) or(@DiaChi is null) 
  or(@quan is null) or(@Email is null)
  begin
	print N'Thông tin không được để null'
  end
else
   begin
	 insert into NGUOIDUNG values
	 (@TenNd,@GioiTinh,@Sdt,@DiaChi,@quan,@Email)
	 print N'Thêm thông tin thành công'
   end


exec sp_insert_nguoidung  @TenNd = N'Nguyễn Duy Anh',
						  @GioiTinh = 1,
						  @Sdt='02563887654',
						  @DiaChi =N'22 Ngô Tất Tố, Phường 3',
						  @quan = N'Quận 12',
						  @Email = 'Anhlun9a@gmail.com'



exec sp_insert_nguoidung  @TenNd = N'Nguyễn Duy Thành',
						  @GioiTinh = 1,
						  @Sdt='0259955484',
						  @DiaChi =N'212 Dương Thị Mười, Phường An Phú Đông',
						  @quan = N'Quận 12',
						  @Email = 'thanhdan@gmail.com'


exec sp_insert_nguoidung  @TenNd = N'Phan Văn Tường',
						  @GioiTinh = 1,
						  @Sdt='0369988547',
						  @DiaChi =N'112 Tô Ký , Phường 7',
						  @quan = N'Quận Gò Vấp',
						  @Email = 'phantuong717@gmail.com'


exec sp_insert_nguoidung  @TenNd = N'Nguyễn Văn Hùng',
						  @GioiTinh = 1,
						  @Sdt='0369889987',
						  @DiaChi =N'15b Phan Huy Ích, Phường 9',
						  @quan = N'Quận Tân Phú',
						  @Email = 'hungga@gmail.com'


exec sp_insert_nguoidung  @TenNd = N'Lê Thị Hồng Nhung',
						  @GioiTinh = 0,
						  @Sdt='0658845654',
						  @DiaChi =N'774 Quang Trung , Phường 11',
						  @quan = N'Quận Bình Thạnh',
						  @Email = 'hongnhung@gmail.com'


exec sp_insert_nguoidung  @TenNd = N'Nguyễn Thúy Kiều',
						  @GioiTinh = 0,
						  @Sdt='06999887451',
						  @DiaChi =N'112 Nguyễn Hữu Cảnh, Phường 24',
						  @quan = N'Quận Bình Thạnh',
						  @Email = 'kieuan@gmail.com'


exec sp_insert_nguoidung  @TenNd = N'Nguyễn Đình Dũng',
						  @GioiTinh = 1,
						  @Sdt='0445987654',
						  @DiaChi =N'356 Châu Phan, Phường 8',
						  @quan = N'Quận Thủ Đức',
						  @Email = 'dungcoc@gmail.com'

exec sp_insert_nguoidung  @TenNd = N'Nguyễn Đình Việt',
						  @GioiTinh = 1,
						  @Sdt='05488554269',
						  @DiaChi =N'225 Cao Văn Á, Phường 22',
						  @quan = N'Quận Bình Thạnh',
						  @Email = 'vietnguyen@gmail.com'



exec sp_insert_nguoidung  @TenNd = N'Nông Văn Thắng',
						  @GioiTinh = 1,
						  @Sdt='02599874545',
						  @DiaChi =N'212 Nguyễn Tri Phong, Phường 22',
						  @quan = N'Quận Bình Thạnh',
						  @Email = 'thangg@gmail.com'




exec sp_insert_nguoidung  @TenNd = N'Lương Hoàng Sơn',
						  @GioiTinh = 1,
						  @Sdt='05588965478',
						  @DiaChi =N'125 Nguyễn Ảnh Thủ, Phường 4',
						  @quan = N'Quận 1',
						  @Email = 'ssonson@gmail.com'



exec sp_insert_nguoidung  @TenNd = N'Nguyễn Thị Duyên',
						  @GioiTinh = 0,
						  @Sdt='03699887754',
						  @DiaChi =N'112 Đông Thạnh, Phường 4',
						  @quan = N'Quận Thủ Đức',
						  @Email = 'duyenb@gmail.com'



select * from NGUOIDUNG

--SP thứ hai thực hiện chèn dữ liệu vào bảng NHATRO
if OBJECT_ID ('sp_insert_nhatro') is not null
drop proc sp_insert_nhatro
go
alter proc sp_insert_nhatro
	@MaLNha int = null,
	@DienTich real = null,
	@GiaPhong money = null,
	@DiaChi nvarchar(100) = null,
	@Quan nvarchar(30) = null,
	@ThongTin nvarchar(100) = null,
	@NgayDang date = null,
	@MaLhe int = null,
	@kt1 int =0,
	@kt2 int =0
as
if(@MaLNha is null) or (@DienTich is null) or
  (@GiaPhong is null) or(@DiaChi is null) or
  (@Quan  is null) or (@NgayDang is null) or
  (@MaLhe is null)
  begin
	print N'Thông tin nhập vào không được null !'
  end
else
  begin
	if not exists (select * from LOAINHA where MaLoaiNha = @MaLNha)
		begin
			set @kt1=1
			print N'Không có loại nhà này'
		end
	if not exists (select * from NGUOIDUNG where Mand = @MaLhe)
		begin
			set @kt2=1
			print N'Người dùng này không tồn tại'
		end
	if @kt1=0 and @kt2=0
		begin
			insert into NHATRO values 
			(@MaLNha,@DienTich,@GiaPhong,@DiaChi,@Quan,@ThongTin,@NgayDang,@MaLhe)
			print N'Thêm thông tin thành công'
		end
  end

exec sp_insert_nhatro @MaLNha = 1,
				      @DienTich = 100,
					  @GiaPhong = 5000000,
					  @DiaChi = N'110 Dương Thị Mười, Phường Tân Chánh Hiệp',
					  @Quan = N'Quận 12',
					  @ThongTin =N'Nội thất đầy đủ, có ban công, nhà xe',
					  @NgayDang = '20200505',
					  @MaLhe = 11

exec sp_insert_nhatro @MaLNha = 2,
				      @DienTich = 150,
					  @GiaPhong = 12000000,
					  @DiaChi = N'199 Phan văn Trị, Phường 7',
					  @Quan = N'Quận Gò Vấp',
					  @ThongTin =N'Nội thất đầy đủ, có 2 giường',
					  @NgayDang = '20200905',
					  @MaLhe = 14		
					  
exec sp_insert_nhatro @MaLNha = 2,
				      @DienTich = 51,
					  @GiaPhong = 2500000,
					  @DiaChi = N'10 Châu Phan, Phường An Lạc',
					  @Quan = N'Quận Gò Vấp',
					  @ThongTin =N'Nội thất đầy đủ, có 2 giường',
					  @NgayDang = '20200310',
					  @MaLhe = 15			
					  
exec sp_insert_nhatro @MaLNha = 3,
				      @DienTich = 140,
					  @GiaPhong = 6000000,
					  @DiaChi = N'459 Hà Phú, Phường 8',
					  @Quan = N'Quận Tân Phú',
					  @ThongTin =N'Nội thất đầy đủ, có 2 giường, máy giặt',
					  @NgayDang = '20200308',
					  @MaLhe = 13		
					  
					  
					  
					  
					  
exec sp_insert_nhatro @MaLNha = 2,
				      @DienTich = 45,
					  @GiaPhong = 1500000,
					  @DiaChi = N'354 Nguyễn Văn Cừ, Phường Tân Phong',
					  @Quan = N'Quận 5 ',
					  @ThongTin =N'Nội thất đầy đủ, có 2 giường, máy giặt',
					  @NgayDang = '20200325',
					  @MaLhe = 10
					  
					  
exec sp_insert_nhatro @MaLNha = 3,
				      @DienTich = 80,
					  @GiaPhong = 7500000,
					  @DiaChi = N'568 Phan bội châu, Phường 6',
					  @Quan = N'Quận Gò Vấp ',
					  @ThongTin =N'Nội thất đầy đủ,Rộng rãi thoáng mát',
					  @NgayDang = '20200512',
					  @MaLhe = 10					  
					  

					  
exec sp_insert_nhatro @MaLNha = 3,
				      @DienTich = 54,
					  @GiaPhong = 6000000,
					  @DiaChi = N'44 Hà Phú, Phường 8',
					  @Quan = N'Quận Gò Vấp ',
					  @ThongTin =N'Nội thất đầy đủ,Rộng rãi thoáng mát',
					  @NgayDang = '20200311',
					  @MaLhe = 16					  
					  					  
					  
					  
exec sp_insert_nhatro @MaLNha = 2,
				      @DienTich = 30,
					  @GiaPhong = 1400000,
					  @DiaChi = N'145 Dương Thị Mười, Phường Tân Chánh Hiệp',
					  @Quan = N'Quận 12 ',
					  @ThongTin =N'Nội thất đầy đủ, có 2 giường',
					  @NgayDang = '20191221',
					  @MaLhe = 17						  
					  
exec sp_insert_nhatro @MaLNha = 1,
				      @DienTich = 140,
					  @GiaPhong = 11000000,
					  @DiaChi = N'110 Phan bội châu, Phường 6',
					  @Quan = N'Quận 10 ',
					  @ThongTin =N'Nội thất đầy đủ, điều hòa, máy giặt , view đẹp',
					  @NgayDang = '20200504',
					  @MaLhe = 10
					  
exec sp_insert_nhatro @MaLNha = 2,
				      @DienTich = 50,
					  @GiaPhong = 2400000,
					  @DiaChi = N'114 Phú Cao, Phường Tân Chánh Hiệp',
					  @Quan = N'Quận 2 ',
					  @ThongTin =N'Nội thất đầy đủ, gần chợ',
					  @NgayDang = '20200608',
					  @MaLhe = 12					  					  
					  
					  
exec sp_insert_nhatro @MaLNha = 2,
				      @DienTich = 70,
					  @GiaPhong = 1500000,
					  @DiaChi = N'144 Đông Bắc, Phường 5',
					  @Quan = N'Quận 12 ',
					  @ThongTin =N'Nội thất đầy đủ, gần trường FPT',
					  @NgayDang = '20200613',
					  @MaLhe = 10					  
					  
					  
					  
					  
					  		  				
select * from LOAINHA

--SP thứ ba thực hiện chèn dữ liệu vào bảng DANHGIA
if OBJECT_ID ('sp_insert_danhgia') is not null
drop proc sp_insert_danhgia
go
create proc sp_insert_danhgia
	@MaNhaTro int = null,
	@MaDanhGia int = null,
	@DanhGia  bit = null,
	@NoiDung nvarchar(100) = null,
	
	@kt1  int =0,
	@kt2 int =0,
	@kt3 int =0
as
if(@MaDanhGia is null) or(@MaNhaTro is null) or(@DanhGia is null)
	BEGIN
		Print N'Thiếu thông tin đầu vào'
	END
else
  begin
	if not exists (select * from NHATRO where MaNha = @MaNhaTro)
		begin
			set @kt1=1
			Print N'Nhà này không tồn tại'
		end
	if not exists (select * from NGUOIDUNG where Mand = @MaDanhGia)
		begin
			set @kt2 = 1
			print N'Người Dùng này không tồn tại'
		end
	if exists (select * from DANHGIA where MaDanhGia = @MaDanhGia and MaNhaTro = @MaNhaTro)
		begin
			set @kt3=1
			print N'Người dùng này đã đánh giá nhà trọ này'
		end
	if @kt1=0 and @kt2=0 and @kt3=0
		begin
			insert into DANHGIA values
			(@MaNhaTro,@MaDanhGia,@DanhGia,@NoiDung)
			print N'Thêm thông tin thành công'
		end
  end
  select * from NHATRO

  exec sp_insert_danhgia @MaNhaTro = 14,
						 @MaDanhGia =11,
						 @DanhGia = 1,
						 @NoiDung =N'Nhà rộng và thoải mãi'

  exec sp_insert_danhgia @MaNhaTro = 14,
						 @MaDanhGia =12,
						 @DanhGia = 0,
						 @NoiDung =N'Nhà khá hẹp, nóng'

  exec sp_insert_danhgia @MaNhaTro = 14,
						 @MaDanhGia =11,
						 @DanhGia = 0,
						 @NoiDung =N'Giá cao'

  exec sp_insert_danhgia @MaNhaTro = 15,
						 @MaDanhGia =15,
						 @DanhGia = 1,
						 @NoiDung =N'Nhà rộng và thoải mãi, đẹp'

  exec sp_insert_danhgia @MaNhaTro = 14,
						 @MaDanhGia =10,
						 @DanhGia = 0,
						 @NoiDung =N'Phòng khá nóng và chật'

  exec sp_insert_danhgia @MaNhaTro = 19,
						 @MaDanhGia =14,
						 @DanhGia = 1,
						 @NoiDung =N'Nhà rộng và thoải mãi'

  exec sp_insert_danhgia @MaNhaTro = 18,
						 @MaDanhGia =17,
						 @DanhGia = 1,
						 @NoiDung =N'Nhà Đẹp, Tiện Nghi'

  exec sp_insert_danhgia @MaNhaTro = 17,
						 @MaDanhGia =12,
						 @DanhGia = 1,
						 @NoiDung =N'Giá cả hợp lý'

  exec sp_insert_danhgia @MaNhaTro = 16,
						 @MaDanhGia =16,
						 @DanhGia = 1,
						 @NoiDung =N'Nhà rộng và thoải mãi'

  exec sp_insert_danhgia @MaNhaTro = 14,
						 @MaDanhGia =10,
						 @DanhGia = 1,
						 @NoiDung =N'Vừa với túi tiền'


  exec sp_insert_danhgia @MaNhaTro = 14,
						 @MaDanhGia =20,
						 @DanhGia = 0,
						 @NoiDung =N'Nhà Xấu'
						 
						 select * from DANHGIA

--2 Truy vấn thông tin

/*
a. Viết một SP với các tham số đầu vào phù hợp. SP thực hiện tìm kiếm thông tin các 
phòng trọ thỏa mãn điều kiện tìm kiếm theo: Quận, phạm vi diện tích, phạm vi ngày đăng
tin, khoảng giá tiền, loại hình nhà trọ. SP này trả về thông tin các phòng trọ, 
gồm các cột có định dạng sau: 
o Cột thứ nhất: có định dạng ‘Cho thuê phòng trọ tại’ + <Địa chỉ phòng trọ>
 + <Tên quận/Huyện>
o Cột thứ hai: Hiển thị diện tích phòng trọ dưới định dạng số theo chuẩn Việt Nam + 
 m2. Ví dụ 30,5 m2
o Cột thứ ba: Hiển thị thông tin giá phòng dưới định dạng số theo định dạng chuẩn 
 Việt Nam. Ví dụ 1.700.000
o Cột thứ tư: Hiển thị thông tin mô tả của phòng trọ 
o Cột thứ năm: Hiển thị ngày đăng tin dưới định dạng chuẩn Việt Nam.
 Ví dụ: 27-02-2012
o Cột thứ sáu: Hiển thị thông tin người liên hệ dưới định dạng sau: 
 ▪ Nếu giới tính là Nam. Hiển thị: A. + tên người liên hệ. Ví dụ A. Thắng 
 ▪ Nếu giới tính là Nữ. Hiển thị: C. + tên người liên hệ. Ví dụ C. Lan 
o Cột thứ bảy: Số điện thoại liên hệ 
o Cột thứ tám: Địa chỉ người liên hệ - Viết hai lời gọi cho SP này
*/

if OBJECT_ID ('sp_select_nhatro') is not null
drop proc sp_select_nhatro
go
Create proc sp_select_NhaTro
	@Quan nvarchar(50) = N'%',
	@LoaiNhaTro nvarchar(100) = N'%',
	@DienTichMax float = null,
	@DienTichMin float = null,
	@NgayDangMax  date = null,
	@NgayDangMin date = null,
	@GiaMax  money = null,
	@GiaMin money = null
as
if @DienTichMax is null
	begin
		select @DienTichMax = max(DIENTICH) from NHATRO
	end
if @DienTichMin is null
	begin
		select @DienTichMin = min(DIENTICH) from NHATRO
	end
if @NgayDangMax is null
	begin
		select @NgayDangMax = max(NHATRO.NGAYDANG) from NHATRO
	end
if @NgayDangMin is null
	begin
		select @NgayDangMin = min(NHATRO.NGAYDANG) from NHATRO
	end
if @GiaMax is null
	begin
		select @GiaMax = max(NHATRO.GiaPhong) from NHATRO
	end
if @GiaMin is null
	begin
		select @GiaMin = min(NHATRO.GiaPhong) from NHATRO
	end

select (N'Cho thuê phòng tại '+NHATRO .DiaChi+', '+NHATRO .QUAN) as N'Địa Chỉ',
	   (REPLACE(CONVERT(varchar,DienTich,103),'.',',')+' m2') as N'Diện Tích',
	   (REPLACE(LEFT(convert(varchar,GiaPhong,1),len(convert(varchar,GiaPhong,1))-3),',','.')+' Vnd') as N'Giá Phòng',
	   NHATRO.ThongTin as N'Thông tin nhà trọ',
	   CONVERT(varchar,NGAYDANG,105) as N'Ngày Đăng',
	   case NGUOIDUNG.GioiTinh
	   when 1 then 'A. ' +NGUOIDUNG.TENND
	   when 0 then 'C. '+NGUOIDUNG.TENND
	   end as N'Người Đăng',
	   DienThoai as N'Điện thoại liên hệ',
	   (Nguoidung.DiaChi+', '+Nguoidung.quan) as N'Địa chỉ người liên hệ'
	   from nhatro join loainha on nhatro.MaLNha = loainha.MaLoaiNha join nguoidung on nhatro.NguoiLienHe =NGUOIDUNG.Mand 
	   where (dientich<=@dientichmax) and (dientich>=@dientichmin) and (ngaydang<=@ngaydangmax) and 
	   (ngaydang>=@ngaydangmin) and (GiaPhong <=@giamax) and (GiaPhong>=@giamin)
	   and(nhatro.quan like @quan) and(loainha.tenloainha like @loainhatro)
	   order by ngaydang


exec sp_select_NhaTro
exec sp_select_NhaTro @loainhatro = N'%Nhà trọ%'
exec sp_select_NhaTro  @GiaMax = 6000000
exec sp_select_NhaTro @Ngaydangmax = '20200402'
exec sp_select_NhaTro @dientichmin = 120

select * from NHATRO

/*
b. Viết một hàm có các tham số đầu vào tương ứng với tất cả các cột của bảng 
NGUOIDUNG. Hàm này trả về mã người dùng (giá trị của cột khóa chính của bảng 
NGUOIDUNG) thỏa mãn các giá trị được truyền vào tham số.
*/

if OBJECT_ID ('fn_MaND') is not null
drop function fn_MaND
go
create function fn_MaND
	(@TenND nvarchar(50) =N'%',
	 @Sdt varchar(15) = N'%',
	 @Diachi nvarchar(100) = N'%',
	 @quan nvarchar(50) = N'%'
	)
returns table
return (Select MaNd from NGUOIDUNG
        where (Tennd like @TenND) and 
		      (DienThoai like @Sdt) and 
			  (DiaChi like @Diachi) and 
			  (Quan like @quan))

select * from dbo.fn_MaND (N'%Nguyễn%','02563887654', N'22 Ngô Tất Tố, Phường 3', default)
select * from dbo.fn_MaND (N'%Nguyễn%', default, default, default)
select * from dbo.fn_MaND (default, default, default, N'%Quận 12%')
select * from NGUOIDUNG

/*
c. Viết một hàm có tham số đầu vào là mã nhà trọ (cột khóa chính của bảng 
NHATRO). Hàm này trả về tổng số LIKE và DISLIKE của nhà trọ này.
*/
if OBJECT_ID ('fn_TongLike') is not null
drop function fn_TongLike
go
create function fn_TongLike
	(@MaNhaTro int)
returns int
as
begin
return
	(select count(Danhgia) as N'Tổng Like' from DANHGIA
	 where MaNhaTro = @MaNhaTro and DanhGia=1)
end
select dbo.fn_TongLike(14) AS N'Tổng Like'
--

if OBJECT_ID ('fn_TongDisLike') is not null
drop function fn_TongDisLike
go
create function fn_TongDisLike
	(@MaNhaTro int)
returns int
as
begin
return
	(select count(Danhgia) as N'Tổng DisLike' from DANHGIA
	 where MaNhaTro = @MaNhaTro and DanhGia=0)
end


select dbo.fn_TongDisLike (14) as N'Tổng DisLike'



--
if OBJECT_ID ('fn_like_Dislike') is not null
drop function fn_Like_Dislike
go
create function fn_like_Dislike
	(@MaNhaTro int)
returns table
as
return
	(select count(case when Danhgia = 1 then 1 end) TổngLike,
	        count(case when Danhgia = 0 then 1 end) TổngDisLike
		    from DANHGIA where MaNhaTro = @MaNhaTro )

select* from fn_like_Dislike(15)

-- Truy vấn
select manha as N'Mã Nhà Trọ',
	   TenLoaiNha as N'Tên Loại Nhà',
	   (REPLACE(CONVERT(varchar,dientich,103),'.',',')+' m2')as N'Diện Tích',
	   (REPLACE(LEFT(convert(varchar,giaphong,1),len(convert(varchar,giaphong,1))-3),',','.')+' VNĐ') as N'Giá Phòng',
	   (NHATRO.DiaChi+', '+NHATRO.Quan)as N'Địa chỉ',
	   dbo.fn_TongLike(MaNha) as N'Tổng Like',
	   dbo.fn_TongDisLike(MaNha) as N'Tổng DisLike',
	   nhatro.ThongTin as N'Thông Tin nhà trọ',
	   convert(varchar,NgayDang,105) as 'Ngày Đăng',
	   NGUOIDUNG.Tennd as N'Người Đăng'
	   from NHATRO join NGUOIDUNG on NHATRO.NguoiLienHe=NGUOIDUNG.Mand
				   join LOAINHA on NHATRO.MaLNha= LOAINHA.MaLoaiNha

/*
d. Tạo một View lưu thông tin của TOP 10 nhà trọ có số người dùng LIKE nhiều nhất gồm 
các thông tin sau:
- Diện tích
- Giá
- Mô tả 
- Ngày đăng tin
- Tên người liên hệ 
- Địa chỉ 
- Điện thoại 
- Email
*/

if OBJECT_ID('top10') is not null
drop view top10
go
create view top10
as
select top 10 NHATRO.MaNha as 'Mã Phòng',
			 (REPLACE(CONVERT(varchar,dientich,103),'.',',')+' m2') as N'Diện Tích',
			 (REPLACE(LEFT(convert(varchar,GiaPhong,1),len(convert(varchar,GiaPhong,1))-3),',','.')+' VND') as 'Giá Phòng',
			 NHATRO.ThongTin as 'Thông tin nhà trọ',
			 (NHATRO.DiaChi+ N', '+NHATRO.QUAN) as N'Địa chỉ nhà trọ',
			 dbo.fn_TongLike(NHATRO.MaNha) as 'Tổng Like',
			 (convert(varchar,NGAYDANG,105)) as 'Ngày Đăng',
			 NGUOIDUNG.Tennd as 'Người đăng',
			 (NGUOIDUNG.DiaChi+', '+NGUOIDUNG.QUAN) as 'Địa chỉ liên hệ',
			 NGUOIDUNG.DienThoai as 'Điện Thoại',
			 NGUOIDUNG.EMAIL as 'Email'
			 from NHATRO join NGUOIDUNG on NHATRO.NguoiLienHe = NGUOIDUNG.Mand join LOAINHA on NHATRO.MaLNha=LOAINHA.MaLoaiNha
			 order by N'Tổng Like' desc
			 
select * from top10

/*
e. Viết một Stored Procedure nhận tham số đầu vào là mã nhà trọ (cột khóa chính của bảng NHATRO).
 SP này trả về tập kết quả gồm các thông tin sau:
- Mã nhà trọ 
- Tên người đánh giá
- Trạng thái LIKE hay DISLIKE
- Nội dung đánh giá
*/
if OBJECT_ID ('sp_nhap_MaNhaTro') is not null
drop proc sp_nhap_MaNhaTro
go
create proc sp_nhap_MaNhaTro
	@Manhatro int 
as
if not exists (select * from NHATRO where MaNha = @Manhatro)
	begin
		print N'Nhà trọ này không tồn tại'
	
	end
else
	begin
		if not exists (select * from DANHGIA where MaNhaTro=@Manhatro)
			begin
				Print N'Nhà trọ này chưa được đánh giá'
			end
		else
			begin
				select DANHGIA.MaNhaTro as 'Mã nhà trọ',
					   NGUOIDUNG.Tennd as 'Tên người đánh giá',
					   case DANHGIA.DanhGia
							when 1  then 'Like'
							when 0 then 'DisLike'
						end as 'Đánh Giá',
						DANHGIA.NoiDung as 'Nội dung đánh giá'
				from DANHGIA join NGUOIDUNG on MaDanhGia=Mand
				where DanhGia.MaNhaTro=@Manhatro
			end
	end


exec sp_nhap_MaNhaTro 1
exec sp_nhap_MaNhaTro 5

exec sp_nhap_MaNhaTro 100


--3. Xóa thông tin
if OBJECT_ID('sp_xoa_nv_dg_dislike') is not null
drop proc sp_xoa_nv_dg_dislike
go
create proc sp_xoa_nv_dg_dislike
	@SoDislike int 
as
begin try
	begin tran	
		declare @MaNhaTro table(MaNhaTro int)
			insert into @MaNhaTro
			select NHATRO.MaNha from NHATRO 
				where dbo.fn_TongDisLike(nhatro.MaNha)>@SoDislike
		delete from DANHGIA
			where DANHGIA.MaNhaTro in (select MaNhaTro from @MaNhaTro)
		delete from NHATRO
			where NHATRO.MaNha in (select MaNhaTro from @MaNhaTro)
		print N'Đã xóa thành công'
	commit tran
end try
begin catch
	rollback tran
	print N'Nhân viên này có số DisLike bé hơn số bạn nhập vào'
end catch

exec sp_xoa_nv_dg_dislike @SoDisLike = 2

select * from DANHGIA
select * from NHATRO



-- 
if OBJECT_ID('sp_delete_NT_NgayDang') is not null
drop proc sp_delete_NT_NgayDang
go
create proc sp_delete_NT_NgayDang
	@NgayDangMin date = null,
	@NgayDangMax date = null
as
begin try
	begin tran
		if(@NgayDangMax is null)
			select @NgayDangMax = max(nhatro.ngaydang) from nhatro
		if(@NgayDangMin is null)
			select @NgayDangMin = MIN(nhatro.ngaydang) from nhatro
		declare @MaNhaTro table(MaNhaTro int)
			insert into @MaNhaTro
			select NHATRO.MaNha from NHATRO 
			where  (NgayDang<=@NgayDangMax) and (NgayDang>=@NgayDangMin)
		delete from DANHGIA
			where DANHGIA.MaNhaTro in (select MaNhaTro from @MaNhaTro)
		delete from NHATRO
			where NHATRO.MaNha in (select MaNhaTro from @MaNhaTro)
		print N'Thao Tác Thành Công'
	commit tran --Để lưu các thay đổi.
end try
begin catch
	rollback tran --Để quay trở lại trạng thái trước khi có thay đổi.
	print N'Thao tác không thành công'
end catch


select * from NHATRO
exec sp_delete_NT_NgayDang @ngaydangmin = '20150614', @NgayDangMax='20150618'


exec sp_insert_nhatro 
                      @MaLNha =2 ,
				      @DienTich = 100,
					  @GiaPhong = 5000000,
					  @DiaChi = N'110 Dương Thị Mười, Phường Tân Chánh Hiệp',
					  @Quan = N'Quận 12',
					  @ThongTin =N'Nội thất đầy đủ, có ban công, nhà xe',
					  @NgayDang = '20150616',
					  @MaLhe = 11
delete from NHATRO where MaNha =24


--
