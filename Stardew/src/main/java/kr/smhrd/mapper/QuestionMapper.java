package kr.smhrd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QuestionMapper {

	void insertQuestion(questionVO qvo);

	public List<questionVO> QuestionList();

}
