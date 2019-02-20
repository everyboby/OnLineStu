package cn.edu.xaut.bean;

import java.io.Serializable;

public class Questinfo
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  private Long questId;
  private String questNumber;
  private String questClass;
  private String questFromTime;
  private String questFromArts;
  private String questFromSubject;
  private String questFromSign;
  private String questContent;
  private String detail_analysis;
  private String questPoint;
  private String quest_videoUrl;
  
  public Questinfo() {}
  
  public Questinfo(Long questId, String questNumber, String questClass, String questFromTime, String questFromArts, String questFromSubject, String questFromSign, String questContent, String detail_analysis, String questPoint, String quest_videoUrl)
  {
    this.questId = questId;
    this.questNumber = questNumber;
    this.questClass = questClass;
    this.questFromTime = questFromTime;
    this.questFromArts = questFromArts;
    this.questFromSubject = questFromSubject;
    this.questFromSign = questFromSign;
    this.questContent = questContent;
    this.detail_analysis = detail_analysis;
    this.questPoint = questPoint;
    this.quest_videoUrl = quest_videoUrl;
  }
  
  public Long getQuestId()
  {
    return this.questId;
  }
  
  public void setQuestId(Long questId)
  {
    this.questId = questId;
  }
  
  public String getQuestNumber()
  {
    return this.questNumber;
  }
  
  public void setQuestNumber(String questNumber)
  {
    this.questNumber = questNumber;
  }
  
  public String getQuestClass()
  {
    return this.questClass;
  }
  
  public void setQuestClass(String questClass)
  {
    this.questClass = questClass;
  }
  
  public String getQuestFromTime()
  {
    return this.questFromTime;
  }
  
  public void setQuestFromTime(String questFromTime)
  {
    this.questFromTime = questFromTime;
  }
  
  public String getQuestFromArts()
  {
    return this.questFromArts;
  }
  
  public void setQuestFromArts(String questFromArts)
  {
    this.questFromArts = questFromArts;
  }
  
  public String getQuestFromSubject()
  {
    return this.questFromSubject;
  }
  
  public void setQuestFromSubject(String questFromSubject)
  {
    this.questFromSubject = questFromSubject;
  }
  
  public String getQuestFromSign()
  {
    return this.questFromSign;
  }
  
  public void setQuestFromSign(String questFromSign)
  {
    this.questFromSign = questFromSign;
  }
  
  public String getQuestContent()
  {
    return this.questContent;
  }
  
  public void setQuestContent(String questContent)
  {
    this.questContent = questContent;
  }
  
  public String getDetail_analysis()
  {
    return this.detail_analysis;
  }
  
  public void setDetail_analysis(String detail_analysis)
  {
    this.detail_analysis = detail_analysis;
  }
  
  public String getQuestPoint()
  {
    return this.questPoint;
  }
  
  public void setQuestPoint(String questPoint)
  {
    this.questPoint = questPoint;
  }
  
  public String getQuest_videoUrl()
  {
    return this.quest_videoUrl;
  }
  
  public void setQuest_videoUrl(String quest_videoUrl)
  {
    this.quest_videoUrl = quest_videoUrl;
  }
  
  public String toString()
  {
    return "Questinfo [questId=" + this.questId + ", questNumber=" + this.questNumber + ", questClass=" + this.questClass + ", questFromTime=" + this.questFromTime + ", questFromArts=" + this.questFromArts + ", questFromSubject=" + this.questFromSubject + ", questFromSign=" + this.questFromSign + ", questContent=" + this.questContent + ", detail_analysis=" + this.detail_analysis + ", questPoint=" + this.questPoint + ", quest_videoUrl=" + this.quest_videoUrl + "]";
  }
}
