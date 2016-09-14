package cn.edu.tju.cs.smt.data;

import java.sql.Timestamp;

public class DataSet {

	// Fields

	private Integer pkId;
	private String tbName;
	private String title;
	private String dataType;
	private Double dataSizeVal;
	private String dataSizeType;
	private String dataSource;
	private String dataDescription;
	private Integer price;
	private Integer downloadCnt;
	private Timestamp pubTime;
	private String publisher;
	private Integer isAudited;
	private Timestamp auditTime;
	private String extra1;
	private String extra2;
	private String extra3;
	private String extra4;
	private String extra5;
	private String extra6;

	// Constructors

	/** default constructor */
	public DataSet() {
	}

	/** full constructor */
	public DataSet(String tbName, String title, String dataType,
			Double dataSizeVal, String dataSizeType, String dataSource,
			String dataDescription, Integer price, Integer downloadCnt,
			Timestamp pubTime, String publisher, Integer isAudited,
			Timestamp auditTime, String extra1, String extra2, String extra3,
			String extra4, String extra5, String extra6) {
		this.tbName = tbName;
		this.title = title;
		this.dataType = dataType;
		this.dataSizeVal = dataSizeVal;
		this.dataSizeType = dataSizeType;
		this.dataSource = dataSource;
		this.dataDescription = dataDescription;
		this.price = price;
		this.downloadCnt = downloadCnt;
		this.pubTime = pubTime;
		this.publisher = publisher;
		this.isAudited = isAudited;
		this.auditTime = auditTime;
		this.extra1 = extra1;
		this.extra2 = extra2;
		this.extra3 = extra3;
		this.extra4 = extra4;
		this.extra5 = extra5;
		this.extra6 = extra6;
	}

	// Property accessors

	public Integer getPkId() {
		return this.pkId;
	}

	public void setPkId(Integer pkId) {
		this.pkId = pkId;
	}

	public String getTbName() {
		return this.tbName;
	}

	public void setTbName(String tbName) {
		this.tbName = tbName;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDataType() {
		return this.dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public Double getDataSizeVal() {
		return this.dataSizeVal;
	}

	public void setDataSizeVal(Double dataSizeVal) {
		this.dataSizeVal = dataSizeVal;
	}

	public String getDataSizeType() {
		return this.dataSizeType;
	}

	public void setDataSizeType(String dataSizeType) {
		this.dataSizeType = dataSizeType;
	}

	public String getDataSource() {
		return this.dataSource;
	}

	public void setDataSource(String dataSource) {
		this.dataSource = dataSource;
	}

	public String getDataDescription() {
		return this.dataDescription;
	}

	public void setDataDescription(String dataDescription) {
		this.dataDescription = dataDescription;
	}

	public Integer getPrice() {
		return this.price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getDownloadCnt() {
		return this.downloadCnt;
	}

	public void setDownloadCnt(Integer downloadCnt) {
		this.downloadCnt = downloadCnt;
	}

	public Timestamp getPubTime() {
		return this.pubTime;
	}

	public void setPubTime(Timestamp pubTime) {
		this.pubTime = pubTime;
	}

	public String getPublisher() {
		return this.publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Integer getIsAudited() {
		return this.isAudited;
	}

	public void setIsAudited(Integer isAudited) {
		this.isAudited = isAudited;
	}

	public Timestamp getAuditTime() {
		return this.auditTime;
	}

	public void setAuditTime(Timestamp auditTime) {
		this.auditTime = auditTime;
	}

	public String getExtra1() {
		return this.extra1;
	}

	public void setExtra1(String extra1) {
		this.extra1 = extra1;
	}

	public String getExtra2() {
		return this.extra2;
	}

	public void setExtra2(String extra2) {
		this.extra2 = extra2;
	}

	public String getExtra3() {
		return this.extra3;
	}

	public void setExtra3(String extra3) {
		this.extra3 = extra3;
	}

	public String getExtra4() {
		return this.extra4;
	}

	public void setExtra4(String extra4) {
		this.extra4 = extra4;
	}

	public String getExtra5() {
		return this.extra5;
	}

	public void setExtra5(String extra5) {
		this.extra5 = extra5;
	}

	public String getExtra6() {
		return this.extra6;
	}

	public void setExtra6(String extra6) {
		this.extra6 = extra6;
	}

}
