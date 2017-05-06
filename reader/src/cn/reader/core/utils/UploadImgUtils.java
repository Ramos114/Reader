package cn.reader.core.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.commons.io.FileUtils;

import cn.reader.front.vo.PicVO;


/**
 * 上传、删除文件的公共类
 * @author HYK
 * @time 2016年12月7日上午11:03:48
 */
public class UploadImgUtils {
	
	public static List<PicVO> upload(File[] file , String [] fileName ,String savaPath ,boolean isThumbPic) throws IOException{
		
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
		String dateNow = formatDate.format(new Date());
		String relativePath = "\\uploadfile\\"+dateNow; ///uploadfile/以日期为文件夹名,保存进数据库的相对路径
		String uploadfilePath = savaPath+"\\uploadfile"; //uploadfile文件夹
		String path = savaPath+relativePath;//(tomcat目录下的绝对路径-->shop/uploadFile/以日期为文件夹名)
		System.out.println(path);
		//String relativePath = savaPath.substring(savaPath.lastIndexOf("shop"))+"\\"+dateNow; //保存进数据库的相对路径
		File uploadfile = new File(uploadfilePath); //判断文件夹是否存在,如果不存在则创建文件夹
		if (!uploadfile.exists()) {//先创建uploadfile文件夹
			uploadfile.mkdir();
		}
		File tempfile = new File(path); //判断文件夹是否存在,如果不存在则创建文件夹
		if (!tempfile.exists()) {//然后创建以日期为文件夹名的文件夹
			tempfile.mkdir();
		}
		List<PicVO> list = new ArrayList<PicVO>();//图片临时对象（picUrl,ThumbPicUrl）
		
		for (int i = 0; i < file.length; i++) {//多文件上传
			PicVO picVO = new PicVO(); //新建临时对象
			// 采用时间+UUID的方式随即命名
			String UUIDFileName = java.util.UUID.randomUUID().toString();
			// 保存在tomcat中的文件名
			String newFileName = UUIDFileName+ fileName[i].substring(fileName[i].lastIndexOf(".")); 
			File tempFile=new File( path, newFileName);
//			
//			FileUtils.copyFile(file[i], tempFile);//保存文件
			//File tempFile=new File(newFileName);
			FileOutputStream fos = new FileOutputStream(tempFile);
			InputStream input = new FileInputStream(file[i]);
	        // 一次30kb
	        byte[] readBuff = new byte[1024 * 30];
	        int count = -1;
	        while ((count = input.read(readBuff, 0, readBuff.length)) != -1) {
	            fos.write(readBuff, 0, count);
	        }
	        fos.flush();
	        fos.close();
	        input.close();
			/*   //size(宽度, 高度) 
			 * 若图片横比200小，高比300小，不变   
			 * 若图片横比200小，高比300大，高缩小到300，图片比例不变   
			 * 若图片横比200大，高比300小，横缩小到200，图片比例不变   
			 * 若图片横比200大，高比300大，图片按比例缩小，横为200或高为300   
			 */ 
			 if(isThumbPic){//是否缩略图
				 Thumbnails.of(path+"\\"+newFileName)   
			        .size(80, 80)  //缩略图统统设置为80 
			        .toFile(path+"\\"+"Thumb_"+newFileName); 
				//JAVA中正则表达式,用"\\\\"表示"\"
				String relativeThumbPath = (relativePath+"\\"+"Thumb_"+newFileName).replaceAll("\\\\", "/");
				picVO.setPicThumbUrl(relativeThumbPath);//缩略图的存放相对地址(转化为/xx/xx/路径)符合URL
			 } 
			 System.out.println(relativePath);
			//JAVA中正则表达式,用"\\\\"表示"\"
			relativePath = (relativePath+"\\"+newFileName).replaceAll("\\\\", "/");
			
			picVO.setPicUrl(relativePath);//图片的存放进数据库相对地址(转化为/xx/xx/路径)符合URL
			System.out.println(relativePath);
			list.add(picVO);
		}
		return list;
	}

	public static boolean delete(String path , List<PicVO> list){
		boolean b = true;
		try{
			for (int i = 0; i < list.size(); i++) {
				String realPicPath = path + list.get(i).getPicUrl(); //项目路径+相对路径拼接成实际路径
				String realThumbPicPath = path + list.get(i).getPicThumbUrl(); //项目路径+相对路径拼接成实际路径
				del(realPicPath);//删除图片
				if(list.get(i).getPicThumbUrl() != null ){
					del(realThumbPicPath);//删除缩略图片
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
			b = false;
		}
		
		return b;
	}
	
	private static void del(String realPath){//删除文件方法
		File file = new File(realPath);
		  if (file.exists()) {
		     try {	 
		    	 FileUtils.forceDelete(file);
		    	 } catch (IOException e) {
		    		  e.printStackTrace();
		    	}
		  }
	}
	
}
