package com.gethobby.common;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.io.Resources;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Value;

import com.gethobby.service.domain.User;

public class ModifyRequestWrapper extends HttpServletRequestWrapper {
	private byte[] b;

	public ModifyRequestWrapper(HttpServletRequest request) throws IOException {
		super(request);
		
		InputStream is = super.getInputStream();
		b = IOUtils.toByteArray(is);
	}

	@Override
	public ServletInputStream getInputStream() throws IOException {
		final ByteArrayInputStream bis = new ByteArrayInputStream(b);
	
		return new ServletInputStreamImpl(bis);

	}
}

class ServletInputStreamImpl extends ServletInputStream{
	private InputStream is;
	
	public ServletInputStreamImpl(InputStream bis){
		is = bis;
	}
	
	public int read() throws IOException {
		return is.read();
	}

	public int read(byte[] b) throws IOException {
		return is.read(b);
	}
}


