package handle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public interface HandleImpl {
	public void handle(HttpServletRequest request, HttpServletResponse response)	throws Exception;
}

