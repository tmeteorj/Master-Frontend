package cn.edu.tju.cs.smt.data;

import java.sql.Timestamp;

public class Mission {
	// Fields

	private Integer missionId;
	private Timestamp startTime;
	private Timestamp finishTime;
	private Integer userId;
	private String outputLoc;
	private Integer state;
	private Timestamp timeout;
	private String name;
	private Integer appId;

	// Constructors

	/** default constructor */
	public Mission() {
	}

	/** minimal constructor */
	public Mission(Integer missionId, Timestamp startTime, Integer userId,
			String outputLoc, Integer state, String name, Integer appId) {
		this.missionId = missionId;
		this.startTime = startTime;
		this.userId = userId;
		this.outputLoc = outputLoc;
		this.state = state;
		this.name = name;
		this.appId = appId;
	}

	/** full constructor */
	public Mission(Integer missionId, Timestamp startTime,
			Timestamp finishTime, Integer userId, String outputLoc,
			Integer state, Timestamp timeout, String name, Integer appId) {
		this.missionId = missionId;
		this.startTime = startTime;
		this.finishTime = finishTime;
		this.userId = userId;
		this.outputLoc = outputLoc;
		this.state = state;
		this.timeout = timeout;
		this.name = name;
		this.appId = appId;
	}

	// Property accessors

	public Integer getMissionId() {
		return this.missionId;
	}

	public void setMissionId(Integer missionId) {
		this.missionId = missionId;
	}

	public Timestamp getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getFinishTime() {
		return this.finishTime;
	}

	public void setFinishTime(Timestamp finishTime) {
		this.finishTime = finishTime;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getOutputLoc() {
		return this.outputLoc;
	}

	public void setOutputLoc(String outputLoc) {
		this.outputLoc = outputLoc;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Timestamp getTimeout() {
		return this.timeout;
	}

	public void setTimeout(Timestamp timeout) {
		this.timeout = timeout;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAppId() {
		return this.appId;
	}

	public void setAppId(Integer appId) {
		this.appId = appId;
	}


}
