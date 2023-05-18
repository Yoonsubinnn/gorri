package com.kh.gorri.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

public class Attachment {
	private int attmId;
	private String savePath;
	private String originalName;
	private String renameName;
	private String boardType;
	private int boardNO;
	private int attmLevel;
	private String userId;
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Attachment(int attmId, String savePath, String originalName, String renameName, String boardType,
			int boardNO, int attmLevel, String userId) {
		super();
		this.attmId = attmId;
		this.savePath = savePath;
		this.originalName = originalName;
		this.renameName = renameName;
		this.boardType = boardType;
		this.boardNO = boardNO;
		this.attmLevel = attmLevel;
		this.userId = userId;
	}

	public int getAttmId() {
		return attmId;
	}

	public void setAttmId(int attmId) {
		this.attmId = attmId;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getRenameName() {
		return renameName;
	}

	public void setRenameName(String renameName) {
		this.renameName = renameName;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public int getBoardNO() {
		return boardNO;
	}

	public void setBoardNO(int boardNO) {
		this.boardNO = boardNO;
	}

	public int getAttmLevel() {
		return attmLevel;
	}

	public void setAttmLevel(int attmLevel) {
		this.attmLevel = attmLevel;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Attachment [attmId=" + attmId + ", savePath=" + savePath + ", originalName=" + originalName
				+ ", renameName=" + renameName + ", boardType=" + boardType + ", boardNO=" + boardNO + ", attmLevel="
				+ attmLevel + ", userId=" + userId + "]";
	}
	
	
	
}
