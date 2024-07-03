package kr.ac.kopo.util;


import java.io.Serializable;

public class Paging implements Serializable {


	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1273286283721492829L;
	

	/**
	 * 전체 레코드 수
	 */
	private int recordTotalCount = 0;

	/**
	 * 페이지 레코드 수(기본값 : 10)
	 */
	private int recordCountPerPage = 10;

	/**
	 * 페이지 번호
	 */
	private int pageNo = 1;

	/**
	 * 페이지의 레코드 시작 번호
	 */
	private int pageStartRecordNo = 0;

	/**
	 * 페이지의 레코드 종료 번호
	 */
	private int pageEndRecordNo = 0;

	/**
	 * 페이지 마지막 번호
	 */
	private int pageLastNo = 0;

	/**
	 * 전체 레코드 수를 가져옵니다.
	 * @return 전체 레코드 수
	 */
	public int getRecordTotalCount() {
		return recordTotalCount;
	}

	/**
	 * 전체 레코드 수를 설정합니다.
	 * @param recordTotalCount 전체 레코드 수
	 */
	public void setRecordTotalCount(int recordTotalCount) {
		this.recordTotalCount = recordTotalCount;
	}

	/**
	 * 페이지 레코드 수를 가져옵니다.
	 * @return 페이지 레코드 수
	 */
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	/**
	 * 페이지 레코드 수를 설정합니다.
	 * @param recordCountPerPage 페이지 레코드 수
	 */
	public void setRecordCountPerPage(int recordCountPerPage) {
		if (recordCountPerPage <= 0) {
			recordCountPerPage = 10;
		}
		this.recordCountPerPage = recordCountPerPage;
	}

	/**
	 * 페이지 번호를 가져옵니다.
	 * @return 페이지 현재 번호
	 */
	public int getPageNo() {
		return pageNo;
	}

	/**
	 * 페이지 번호를 설정합니다.
	 * @param pageNo 페이지 현재 번호
	 */
	public void setPageNo(int pageNo) {
		if (pageNo <= 0) {
			pageNo = 1;
		}
		this.pageNo = pageNo;
	}

	/**
	 * 페이지의 레코드 시작 번호를 가져옵니다.
	 * @return 페이지의 레코드 시작 번호
	 */
	public int getPageStartRecordNo() {
		return pageStartRecordNo;
	}

	/**
	 * 페이지의 레코드 종료 번호를 가져옵니다.
	 * @return 페이지의 레코드 종료 번호
	 */
	public int getPageEndRecordNo() {
		return pageEndRecordNo;
	}

	/**
	 * 페이지 마지막 번호를 가져옵니다.
	 * @return 페이지 마지막 번호
	 */
	public int getPageLastNo() {
		return pageLastNo;
	}

	/**
	 * one 베이스(oracle)로 페이징을 처리합니다.
	 */
	public void processOne() {
		process(false);
	}

	/**
	 * zero 베이스(mariaDB, mySQL)로 페이징을 처리합니다.
	 */
	public void processZero() {
		process(true);
	}

	/**
	 * 페이징을 처리합니다.
	 * @param zero 제로 베이스 여부 (true : mariaDB, mySQL은 zero 베이스, false : oracle은 1 베이스)
	 */
	public void process(boolean zero) {
		// 레코드 번호
		int startBase = 1;
		int endBase = 0;
		// 제로 베이스 
		if (zero) {
			startBase = 0;
			endBase = -1;
		}
		
		// 페이지 마지막 번호 설정
		// 나머지가 있으면 페이지 마지막 번호를 증가 시킴
		pageLastNo = (recordTotalCount / recordCountPerPage) + (recordTotalCount % recordCountPerPage == 0 ? 0 : 1);
		if (pageLastNo > 0) {
			if (pageNo <= pageLastNo) {
				// 페이지의 레코드 시작 번호 설정
				pageStartRecordNo = ((pageNo - 1) * recordCountPerPage) + startBase;
				// 페이지의 레코드 종료 번호 설정
				pageEndRecordNo = pageNo * recordCountPerPage + endBase;
				// 페이지의 레코드 종료 번호가 전체 레코드 수보다 크면 전체 레코드 수로 변경
				if (pageEndRecordNo > (recordTotalCount + endBase)) {
					pageEndRecordNo = recordTotalCount + endBase;
				}
			} else {
				pageStartRecordNo = 0;
				pageEndRecordNo = 0;
			}
		} else {
			pageStartRecordNo = 0;
			pageEndRecordNo = 0;
			pageLastNo = 0;
		}
	}
}