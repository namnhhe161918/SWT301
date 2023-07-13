
package Controller.PostCRUD;




import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(name="ImageUploadServlet", urlPatterns={"/ImageUploadServlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class ImageUploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "upload"; // Thư mục lưu trữ ảnh tải lên

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = "";
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir(); // Tạo thư mục lưu trữ ảnh nếu chưa tồn tại
        }

        try {
            Part filePart = request.getPart("file");
            fileName = (String) getFileName(filePart);

            // Ghi tệp tin vào thư mục lưu trữ
            OutputStream out = new FileOutputStream(new File(uploadPath + File.separator + fileName));
            InputStream fileContent = filePart.getInputStream();

            int read;
            final byte[] buffer = new byte[1024];
            while ((read = fileContent.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }

            out.close();
            fileContent.close();
        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
        }

        response.getWriter().println(fileName);
    }

    public String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        System.out.println("*****partHeader :" + partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }

        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("tiny.jsp").forward(request, response);
    }

}
