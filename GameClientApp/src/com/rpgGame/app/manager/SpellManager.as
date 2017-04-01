package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.app.utils.UpgradeUtil;
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.SkillLvLDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_skill_ignore;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	import com.rpgGame.coreData.lang.LangSpell;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import app.message.SpellLearnProto;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	/**
	 * 技能管理类
	 * @author luguozheng
	 * 
	 */	
	public class SpellManager
	{
		/** 技能格子位置hash **/
		private static var gridPosConfigMap:HashMap = new HashMap;
		
		public function SpellManager()
		{
		}
		
		
		/**
		 *是否可以升级或者升阶 
		 * @param skillId
		 * @return 
		 * 
		 */
		public static function canUpOrRise(skillId:int):Boolean
		{
			var result:Boolean=true;
			var data:HeroData=MainRoleManager.actorInfo;
			var skillInfo:SkillInfo=data.spellList.getSkillInfo(skillId);
			if(!skillInfo){//没学习的技能
				return false;
			}
			var cfg:Q_skill_model=SpellDataManager.getSpellData(skillId,skillInfo.skillLevel);//技能配置
			var canUp:Boolean=true;
			var canRise:Boolean=true;
			var myLv:int=data.totalStat.level;
			var myMp:int=data.curZhenqi;
			var myMon:int=data.totalStat.getResData(CharAttributeType.RES_BIND_MONEY)+ data.totalStat.getResData(CharAttributeType.RES_MONEY);
			var key:String=skillId+"_"+skillInfo.skillChildLv;
			var lvData:Q_skill_ignore=SkillLvLDataManager.getData(key);
			var needMp:int;
			var needMy:int;
			var needLv:int;
			
			if(!lvData){//找不到升级数据
				canUp =false;
			}else{
				needMp=lvData.q_energy;
				needMy=lvData.q_copper;
				needLv=lvData.q_playerlevel;
				if(needMp>myMp||needLv>myLv||needMy>myMon){//不满足升级条件
					canUp =false;
				}
			}
			
			if(skillInfo.skillChildLv==cfg.q_max_level){//不可升级
				canUp =false;
			}
			
			if(skillInfo.skillLevel==cfg.q_max_grade){//不升阶
				canRise =false;
			}
			cfg=SpellDataManager.getSpellData(cfg.q_skillID,cfg.q_max_grade);
			var i:int=0;
			if(!cfg){//不可升阶
				canRise =false;
			}else{
				needLv=cfg.q_level_up;
				needMp=cfg.q_energy_up;
				needMy=cfg.q_cost_up;
				var neeSkill:int=cfg.q_need_skill_level;
				if(needMp>myMp||needLv>myLv||needMy>myMon||neeSkill>skillInfo.skillChildLv){//不满足升阶条件
					canRise =false;
				}
				if(cfg.q_need_items&&cfg.q_need_items.length!=0){
					var items:Array=JSON.parse(cfg.q_need_items) as Array;//[{"mod":9017,"num":1}]
					var itemDes:Array=[];
					for(i=0;i<items.length;i++){
						var item:Q_item=ItemConfig.getQItemByID(items[i].mod);
						var needNum:int=items[i].num;
						var myNum:int=BackPackManager.instance.getItemCount(items[i].mod);
						if(needNum>myNum){//物品不足
							canRise=false;
							break;
						}
					}
				}
			}
			
			result=canUp||canRise;
			return result;			
		}
		
		/**
		 * 得到剩余没用的技能点
		 * @return 
		 * 
		 */		
		public static function getHasLastSpellPoint():int
		{
			var raceSpell:int = MainRoleManager.actorInfo.spellList.getCurRaceSpellAllLevel( 0 );
			var allSpellPoint:int = MainRoleManager.actorInfo.spellList.getAllSpellPoint();
			return allSpellPoint - raceSpell;
		}
		
		/**
		 * 得到对职业类技能的投入点数
		 * @return 
		 * 
		 */		
//		public static function getRaceSpellPoint():int
//		{
//			return MainRoleManager.actorInfo.spellList.getCurRaceSpellAllLevel( MainRoleManager.actorInfo.spellList.race );
//		}
		
		/**
		 * 是否还有技能点没用
		 * @return 
		 * 
		 */		
		public static function isHasSpellPoint():Boolean
		{
			return getHasLastSpellPoint() > 0;
		}
		
		/**
		 * 该类型技能是否可升级
		 * @param spellType
		 * @return 
		 * 
		 */		
		public static function canUpdateByType(spellID:int):Boolean
		{
//			return canUpdate( SpellDataManager.getSpellLearnData(spellID) );
			return false;
		}
		
		/**
		 * 是否可升级 
		 * @param spellLearnProto
		 * @param hintOnFail 是否需要提示
		 * @return 
		 * 
		 */		
		public static function canUpdate(spellLearnProto:SpellLearnProto,  hintOnFail:Boolean = false):Boolean
		{
			//无技能点可用了
			if( !isHasSpellPoint() )
			{
				if(hintOnFail)NoticeManager.showHint(EnumHintInfo.SPELL_LEARN_UPGRADE_FAIL8);
				return false;
			}
			
			if(!spellLearnProto){
				return false;
			}
			
			//学习该技能需要的前置该系技能花费的技能点
			if( spellLearnProto.categoryCostSpellPoint > getIndexLearnAllPoint( spellLearnProto.spell.spellType ) )
			{
				if(hintOnFail)NoticeManager.showHint(EnumHintInfo.SPELL_LEARN_UPGRADE_FAIL10);
				return false;
			}
			
			//是否学习过前置技能
			if( spellLearnProto.preSpellType != 0 && !MainRoleManager.actorInfo.spellList.hasTypeSpell( spellLearnProto.preSpellType ) )
			{
				if(hintOnFail)NoticeManager.showHint(EnumHintInfo.SPELL_LEARN_UPGRADE_FAIL9);
				return false;
			}
			
			//学过别的系就不能学这个系的了
//			if( MainRoleManager.actorInfo.spellList.race != -1 && spellLearnProto.spell.race != 0 && spellLearnProto.spell.race != MainRoleManager.actorInfo.spellList.race )
//			{
//				if(hintOnFail)NoticeManager.showHint(EnumHintInfo.SPELL_LEARN_UPGRADE_FAIL12);
//				return false;
//			}
			//------------------------------
//			var spellProto:Q_skill_model = MainRoleManager.actorInfo.spellList.getSpell( spellLearnProto.spell.spellType );
//			if( spellProto == null )
//			{
//				//如果为空说明这个技能没有学习过，那么就用配置的数据，就是一级数据
//				spellProto = spellLearnProto.spell;
//			}
//			//满级
//			if( spellProto.nextSpell == null)
//			{
//				if(hintOnFail)NoticeManager.showHint(EnumHintInfo.SPELL_LEARN_UPGRADE_FAIL2);
//				return false;
//			}
//			//还没达到下一级的标准时
//			if(spellProto.nextSpell.canLearnLevel > MainRoleManager.actorInfo.totalStat.level )
//			{
//				if(hintOnFail)NoticeManager.showHint(EnumHintInfo.SPELL_LEARN_UPGRADE_FAIL3);
//				return false;
//			}
			//------------------------------
			
			if( !isCanLearnMutex( spellLearnProto.spell.spellType ) )
			{
				return false;
			}
			return true;
		}
		
		/**
		 * 是还可 
		 * @param spellType
		 * @return 
		 * 
		 */		
		public static function isCanLearnMutex( spellType:int ):Boolean
		{
//			var index:int;
//			var mutex:int
//			var mutexArr:Array = SpellDataManager.getSpellMutexIndex( spellType );
//			index = mutexArr[1];
//			mutex = mutexArr[0];
//			var spells:Array = MainRoleManager.actorInfo.spellList.getSpellList();
//			var len:int = spells.length;
//			var spellProto:SpellProto
//			for( var i:int = 0; i < len; i++ )
//			{
//				spellProto = spells[i];
//				mutexArr = SpellDataManager.getSpellMutexIndex(spellProto.spellType);
//				
//				if( mutexArr[1] == -1 )
//					continue;
//				//学习过的技能里有同系且索引不同的，是不能学习
//				if( mutexArr[ 0 ] == mutex && index != mutexArr[1] )
//					return false;
//			}
			
			return true;
		}
		
		/**
		 * 学习或升级技能-通过spellType
		 * @param spellType
		 * @param hintOnFail
		 * 
		 */		 
		public static function learnOrUpdateSpellByType(spellType:int, hintOnFail:Boolean = false):void
		{
//			learnOrUpdateSpell(SpellDataManager.getSpellLearnData(spellType), hintOnFail)
		}
		
		/**
		 * 学习或升级技能 
		 * @param spellLearnProto
		 * @param hintOnFail
		 * 
		 */		
		public static function learnOrUpdateSpell(spellLearnProto:SpellLearnProto, hintOnFail:Boolean = false):void
		{
			if(!spellLearnProto || !canUpdate(spellLearnProto, hintOnFail))return;
			var upgradeInfo:UpgradeProtoInfo = new UpgradeProtoInfo( spellLearnProto.spell.nextSpell.learnCost );
			var itemListVo:UpgradeItemListVo = UpgradeUtil.getUpgradeItemListVo( upgradeInfo );
			if( itemListVo == null )
				return;
			SpellSender.learnOrUpgradeActiveSpell( spellLearnProto.spell.spellType, itemListVo);
		}
		
		/**
		 * 当前这个系总投入点数
		 * @param spellType
		 * @return 
		 * 
		 */		
		public static function getIndexLearnAllPoint( spellType:int ):int
		{
//			var index:int;
//			var mutexArr:Array = SpellDataManager.getSpellMutexIndex( spellType );
//			index = mutexArr[1];
//			var spells:Array = MainRoleManager.actorInfo.spellList.getSpellList();
//			var len:int = spells.length;
//			var spellProto:SpellProto;
//			var allLevel:int = 0;
//			for( var i:int = 0; i < len; i++ )
//			{
//				spellProto = spells[i];
//				mutexArr = SpellDataManager.getSpellMutexIndex(spellProto.spellType);
//				
//				if( mutexArr[1] == index )
//				{
//					allLevel += spellProto.spellLevel;
//				}
//			}
//			
//			return allLevel;
			return 0;
		}
		
		/**
		 * 学习或升级技能成功
		 * @param spellProto
		 * 
		 */		
		public static function onLearnedOrUpgradedActiveSpell( spellProto:Q_skill_model ):void
		{
//			if( MainRoleManager.actorInfo.spellList.race == -1 )
//			{
//				if( spellProto.race != 0 )
//				{
//					MainRoleManager.actorInfo.spellList.race = spellProto.race;
//				}
//			}
			
//			trace("升级成功")
			MainRoleManager.actorInfo.spellList.addSpell( spellProto );
			ShortcutsManger.getInstance().updateNewSpell(spellProto);
			EventManager.dispatchEvent( SpellEvent.SPELL_CHANGE );
		}
		
		/**
		 * 请求洗点成功
		 * 
		 * 客户端将当前使用的技能点点数重置为0，将当前已经学习的技能重置
		 */
		public static function onClearSpellsSuccess():void
		{
			MainRoleManager.actorInfo.spellList.clearSpell();
			
			ShortcutsManger.getInstance().clearSpell();
			
			EventManager.dispatchEvent( SpellEvent.SPELL_CHANGE );
			
			EventManager.dispatchEvent( SpellEvent.SPELL_UPDATE_SHORTCUTS );
		}
		
		/**
		 * 获得新的技能点 
		 * @param obtainPoint 新的总的获得的技能点数
		 * 
		 */		
		public static function onObtainSpellPoint( obtainPoint:int ):void
		{
			MainRoleManager.actorInfo.spellList.obtainSpellPoint = obtainPoint;
			
			EventManager.dispatchEvent( SpellEvent.SPELL_CHANGE );
		}
		
		/**
		 * 技能面板上格子所在的位置坐标
		 * @param job 职业
		 * @param tab 标签页
		 * @param index 索引
		 * @return 
		 * 
		 */		
		public static function getSpellGridPos( job:int, tab:int, index:int ):Array
		{
			var posMap:HashMap = gridPosConfigMap.getValue( job );
			if( posMap == null )
			{
				posMap = readConfig( job )
				gridPosConfigMap.add( job, posMap );
			}
			
			if( posMap == null )
				return null;
			
			var tapMap:HashMap = posMap.getValue( tab );
			return tapMap.getValue( index );
		}
		
		private static function readConfig( job:int ):HashMap
		{
			var tabMap:HashMap = new HashMap();
			tabMap.add( 0, getJobGridPos( job, 0 ) );
			tabMap.add( 1, getJobGridPos( job, 1 ) );
			tabMap.add( 2, getJobGridPos( job, 2 ) );
			return tabMap;
		}		
		
		/**
		 * 根据职业、以及tab标签索引获取对应的格子位置的数据 
		 * @param job 职业
		 * @param tab 索引
		 * @return 
		 * 
		 */		
		private static function getJobGridPos(job:int, tab:int):HashMap
		{
			var posMap:HashMap = new HashMap();
			
			var configArr:Array = getPosConfig( job, tab ).split( "|" );
			var len:int = configArr.length;
			for(var i:int = 0; i < len; i++ )
			{
				posMap.add( i, String(configArr[i]).split( "," ) );
			}
			
			return posMap;
		}
		
		/**
		 * 格子位置 
		 * @param job
		 * @param tab
		 * @return 
		 * 
		 */		
		private static function getPosConfig(job:int, tab:int):String
		{
			if( job < 8 )
			{
				if( tab == 0 )
					return LanguageConfig.getText( LangSpell.SPELL_GRID_POINT_1 );
				else
					return LanguageConfig.getText( LangSpell.SPELL_GRID_POINT_2 );
			}
			return LanguageConfig.getText( LangSpell.SPELL_GRID_POINT_2 );
		}
	}
}