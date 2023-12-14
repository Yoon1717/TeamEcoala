package com.ecoala.ele.eleAnalysis.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecoala.ele.eleAnalysis.service.EleAnalysisService;
import com.ecoala.ele.eleAnalysis.vo.EleAnalysisVO;



@Controller
public class EleAnalysisController {

	

	@Autowired
	EleAnalysisService eleAnalysisService; 
	

	@RequestMapping("/eleAnalysisView")
	public String eleAnalysis() {
		return "user/eleAnalysis/eleAnalysisView";
	}
	

	@ResponseBody
	@PostMapping("/oneMonthEleDo")
	public  List<EleAnalysisVO>  oneMonthEleDo(@RequestBody EleAnalysisVO user) throws Exception {
		 List<EleAnalysisVO> result = eleAnalysisService.oneMonthEle(user);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/comparisonEleDo")
	public  List<EleAnalysisVO>  comparisonEleDo(@RequestBody EleAnalysisVO user) throws Exception {
		 List<EleAnalysisVO> result = eleAnalysisService.comparisonEle(user);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/weatherListDo")
	public  List<EleAnalysisVO>  weatherListDo(@RequestBody EleAnalysisVO user) throws Exception {
		 List<EleAnalysisVO> result = eleAnalysisService.weatherList(user);
		return result;

}
	
}
