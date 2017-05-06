package cn.reader.front.vo;

public class PicVO {

	private String picUrl;
	private String picThumbUrl;
	
	public PicVO() {
		super();
	}
	public PicVO(String picUrl, String picThumbUrl) {
		super();
		this.picUrl = picUrl;
		this.picThumbUrl = picThumbUrl;
	}
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public String getPicThumbUrl() {
		return picThumbUrl;
	}
	public void setPicThumbUrl(String picThumbUrl) {
		this.picThumbUrl = picThumbUrl;
	}
	
}
