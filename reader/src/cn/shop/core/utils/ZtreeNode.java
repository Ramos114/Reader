package cn.shop.core.utils;

import java.io.Serializable;

public class ZtreeNode {
	  
    private Serializable id;  
    private Serializable pId;  
    private String name;  
    private int isParent;//是父节点就用1表示，不是就不用表示
    private boolean checked;//true选中,false不选中
    private int open;//1:打开   0:关闭
    
	public ZtreeNode() {
		super();
	}
	
	
	
	
	public ZtreeNode(Serializable id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	

	public ZtreeNode(Serializable id, String name, int open) {
		super();
		this.id = id;
		this.name = name;
		this.open = open;
	}


	public ZtreeNode(Serializable id, Serializable pId, String name, int open) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.open = open;
	}


	public ZtreeNode(Serializable id, Serializable pId, String name,
			int isParent, int open) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.isParent = isParent;
		this.open = open;
	}
	

	
	public ZtreeNode(Serializable id, Serializable pId, String name,
			int isParent, boolean checked, int open) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.isParent = isParent;
		this.checked = checked;
		this.open = open;
	}


	public Serializable getId() {
		return id;
	}
	
	public void setId(Serializable id) {
		this.id = id;
	}
	
	public Serializable getpId() {
		return pId;
	}
	
	public void setpId(Serializable pId) {
		this.pId = pId;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getIsParent() {
		return isParent;
	}
	
	public void setIsParent(int isParent) {
		this.isParent = isParent;
	}
	
	
	
	public boolean isChecked() {
		return checked;
	}




	public void setChecked(boolean checked) {
		this.checked = checked;
	}




	public int getOpen() {
		return open;
	}
	
	public void setOpen(int open) {
		this.open = open;
	}
	
}
