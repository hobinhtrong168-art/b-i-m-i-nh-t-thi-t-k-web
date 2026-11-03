# Hướng dẫn chạy máy chủ điểm Đa game

Các game trên web ghi nhận tên người chơi, kết quả, thời gian và từng bước chơi, rồi gửi về máy chủ. Máy chủ lưu vào file `server/data/db.json` (tự tạo khi chạy lần đầu). Trang quản lý điểm đọc dữ liệu từ máy chủ này.

## Cách chạy (Windows)
1. Cài Node.js (bản LTS) nếu máy chưa có.
2. Bấm đúp `start.bat` (hoặc chạy lệnh `node server/server.js` trong thư mục này).
3. Mở **http://localhost:3000** để chơi game và **http://localhost:3000/admin** để quản lý điểm.

## Đổi mật khẩu quản trị
Mật khẩu mặc định là `admin123`. Mở `start.bat`, sửa dòng `set ADMIN_KEY=admin123` thành mật khẩu của bạn.

## Lưu ý quan trọng
- Máy chủ phải đang chạy thì dữ liệu mới về được trang quản lý. Nếu máy chủ tắt, trình duyệt của người chơi giữ kết quả trong hàng đợi và tự gửi lại khi máy chủ chạy lại.
- Mở trang bằng cách bấm đúp file `index.html` (đường dẫn `file://`) vẫn gửi được dữ liệu về `http://localhost:3000` nếu máy chủ chạy trên cùng máy.
- Muốn người khác chơi từ máy của họ và điểm về máy bạn, cần đặt máy chủ ở nơi có địa chỉ truy cập được (máy chủ công cộng hoặc dịch vụ hosting Node.js). Khi đó mở trang game với `?server=https://dia-chi-may-chu` một lần để trình duyệt nhớ địa chỉ. GitHub Pages hoặc hosting tĩnh không chạy được máy chủ này.
- Hãy sao lưu bằng nút "Sao lưu JSON" ở trang quản lý trước khi xóa dữ liệu.

## Lỗi thường gặp
- **`Invalid parameter - server\server.js`**: bạn gõ nhầm `mode` thay vì `node`. Lệnh đúng là `node server/server.js`. Cách dễ nhất là bấm đúp `start.bat`, hoặc gõ `npm start` trong terminal.
- **`node is not recognized`**: máy chưa cài Node.js. Tải bản LTS tại nodejs.org, cài xong mở lại VS Code hoặc terminal. Kiểm tra bằng lệnh `node -v`.
- **`EADDRINUSE`**: cổng 3000 đang bị chương trình khác dùng, thường là cửa sổ máy chủ cũ. Đóng nó rồi chạy lại.
- **Nhạc YouTube báo "Your browser can't play this video"**: trình duyệt tích hợp của VS Code (Simple Browser) không phát được video YouTube. Hãy mở `http://localhost:3000` bằng Chrome hoặc Edge.
- **Nhạc không phát khi mở file `index.html` trực tiếp**: YouTube từ chối nhúng khi trang mở bằng `file:///`. Hãy mở qua `http://localhost:3000`.
- **Muốn nhạc chạy chắc chắn mọi nơi**: chép file mp3 của bạn vào thư mục `music/` và ghi đường dẫn vào `MUSIC_FILE` trong `js/music-config.js`.

## Game Bắn chữ và quản lý nội dung
- Game Bắn chữ (luyện gõ tiếng Anh) nằm trong bộ Đa game: `http://localhost:3000/projects/da-game/games/ban-chu.html`.
- Ở trang quản lý điểm (`/admin`) có thêm: cài đặt game (bật/tắt game, tốc độ rơi, hiện nghĩa tiếng Việt), kho từ vựng (thêm, sửa nghĩa, đổi cấp độ, bật/tắt, xóa, nhập hàng loạt, xuất CSV) và thống kê (tốc độ gõ WPM, độ chính xác, combo, chữ khó nhất).
- Nếu máy chủ không chạy, game vẫn chơi được bằng bộ từ có sẵn nhưng dữ liệu không về trang quản lý.
