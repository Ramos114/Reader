package cn.reader.core.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GsonUtils {
	public static Gson GSON = new GsonBuilder()
			.serializeNulls()
			.setDateFormat("yyyy-MM-dd HH:mm:ss")
			.setPrettyPrinting().create();
}
