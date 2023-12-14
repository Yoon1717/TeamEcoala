package com.ecoala.ele.main.vo;


public class CombinedVO {
    private EleUsageVO eleUsageVO;
    private TypeEleVO typeEleVO;

    // 생성자, getter, setter 등 필요한 메서드 추가

    // 기본 생성자
    public CombinedVO() {
    }

    // 매개변수를 받는 생성자
    public CombinedVO(EleUsageVO eleUsageVO, TypeEleVO typeEleVO) {
        this.eleUsageVO = eleUsageVO;
        this.typeEleVO = typeEleVO;
    }

	public EleUsageVO getEleUsageVO() {
		return eleUsageVO;
	}

	public void setEleUsageVO(EleUsageVO eleUsageVO) {
		this.eleUsageVO = eleUsageVO;
	}

	public TypeEleVO getTypeEleVO() {
		return typeEleVO;
	}

	public void setTypeEleVO(TypeEleVO typeEleVO) {
		this.typeEleVO = typeEleVO;
	}

	@Override
	public String toString() {
		return "CombinedVO [eleUsageVO=" + eleUsageVO + ", typeEleVO=" + typeEleVO + "]";
	}
    
	
	
	
	
}
