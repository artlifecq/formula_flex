package com.rpgGame.coreData.info.society
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.enum.SocietyTrendsType;
	import com.rpgGame.coreData.lang.LangSociety;
	import com.rpgGame.coreData.utils.MoneyUtil;

	import app.message.FamilyNewsProto;
	import app.message.FamilyNewsProto.FamilyBiaoNewsProto.BiaoNewsType;

	/**
	 *
	 * 帮派动态日志数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-02-02 上午10:30:12
	 *
	 */
	public class SocietyTrendsData
	{
		/** 类型 **/
		public var type : int;
		/** 内容 **/
		public var content : String;
		/** 时间 **/
		public var time : Number;

		public function SocietyTrendsData()
		{
		}

		public function setConfig(newsProto : FamilyNewsProto) : void
		{
			type = 0;
			time = newsProto.time ? newsProto.time.toNumber() : 0;
			this.content = "";

			if (newsProto.addMember)
			{
				type = SocietyTrendsType.REN_SHI_TRENDS;
				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_ADD_MEMBER, newsProto.addMember.addMember.name);
			}
			else if (newsProto.kickMember)
			{
				type = SocietyTrendsType.REN_SHI_TRENDS;
				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_KICK_MEMBER, SocietyMemberData.getPosName(newsProto.kickMember.kickerPos), newsProto.kickMember.kicker.name, newsProto.kickMember.beenKick.name);
			}
			else if (newsProto.leaveFamily)
			{
				type = SocietyTrendsType.REN_SHI_TRENDS;
				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_LEAVE_FAMILY, newsProto.leaveFamily.leaveMember.name);
			}
			else if (newsProto.changePos)
			{
				type = SocietyTrendsType.REN_SHI_TRENDS;
				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_CHANGE_POS, newsProto.changePos.changePosMember.name, SocietyMemberData.getPosName(newsProto.changePos.pos));
			}
			else if (newsProto.beenKilled)
			{
//				type = SocietyTrendsType.JIA_ZU_HUO_DONG;
//				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_BEEN_KILLED, newsProto.beenKilled.beenKillByOtherMember.name, MapDataManager.getMapName(newsProto.beenKilled.beenKillByOtherSceneId), newsProto.beenKilled.other.name);
			}
			else if (newsProto.killOther)
			{
//				type = SocietyTrendsType.JIA_ZU_HUO_DONG;
//				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_KILL_OTHER, newsProto.killOther.killOtherMember.name, MapDataManager.getMapName(newsProto.killOther.killOtherSceneId), newsProto.killOther.other.name);
			}
			else if (newsProto.killBoss)
			{
//				type = SocietyTrendsType.JIA_ZU_HUO_DONG;
//				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_KILL_BOSS, newsProto.killBoss.killBossMember.name, MapDataManager.getMapName(newsProto.killBoss.killBossSceneId), newsProto.killBoss.bossName);
			}
			else if (newsProto.beenKilledByBoss)
			{
//				type = SocietyTrendsType.JIA_ZU_HUO_DONG;
//				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_BEEN_KILLED_BY_BOSS, newsProto.beenKilledByBoss.beenKillByBossMember.name, MapDataManager.getMapName(newsProto.beenKilledByBoss.beenKillByBossSceneId), newsProto.beenKilledByBoss.bossName);
			}
			else if (newsProto.buildingUpgrade)
			{
				type = SocietyTrendsType.JIA_ZU_BUILD;
				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_BUILDING_UPGRADE, SocietyBuildData.getBuildName(newsProto.buildingUpgrade.buildingType), newsProto.buildingUpgrade.level);
			}
			else if (newsProto.donateBuildToken)
			{
				type = SocietyTrendsType.JUAN_XIAN_JI_LU;
				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_DONATE_BUILD_TOKEN, newsProto.donateBuildToken.donateTokenMember.name, newsProto.donateBuildToken.tokenCount.toNumber(), newsProto.donateBuildToken.contribution);
			}
			else if (newsProto.donateMoney)
			{
				type = SocietyTrendsType.JUAN_XIAN_JI_LU;
				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_DONATE_MONEY, newsProto.donateMoney.donateMoneyMember.name, MoneyUtil.getHtmlMoneyString(newsProto.donateMoney.money.toNumber()), newsProto.donateMoney.contribution);
			}
			else if (newsProto.animalBarStart)
			{
				type = SocietyTrendsType.JIA_ZU_HUO_DONG;
				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_ANIMAL_BAR_START);
			}
			else if (newsProto.killFamilyAnimalBarBoss)
			{
				type = SocietyTrendsType.JIA_ZU_HUO_DONG;
				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_KILL_ANIMAL_BAR_BOSS, newsProto.killFamilyAnimalBarBoss.killBossMember.name);
			}
			else if (newsProto.familyBiaoNews)
			{
				type = SocietyTrendsType.JIA_ZU_HUO_DONG;
				switch (newsProto.familyBiaoNews.type)
				{
					case BiaoNewsType.START:
						this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_FAMILY_BIAO_NEWS_START);
						break;
					case BiaoNewsType.COMPLETE:
						this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_FAMILY_BIAO_NEWS_COMPLETE);
						break;
					case BiaoNewsType.DAMAGE:
						this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_FAMILY_BIAO_NEWS_DAMAGE);
						break;
					case BiaoNewsType.DESTORY:
						this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_FAMILY_BIAO_NEWS_DESTORY);
						break;
				}
			}
			else if (newsProto.impeachLeader)
			{
				type = SocietyTrendsType.REN_SHI_TRENDS;
				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_IMPEACH_LEADER, newsProto.impeachLeader.impeachMember.name, newsProto.impeachLeader.beenImpeachMember.name);
			}
			else if (newsProto.createFamily)
			{
				type = SocietyTrendsType.REN_SHI_TRENDS;
				this.content = LanguageConfig.getText(LangSociety.SOCIETY_TRENDS_CREATE_FAMILY, newsProto.createFamily.creator.name);
			}
		}
	}
}
