package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.info.stat.StatData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.netData.player.bean.AttributeItem;
	
	import flash.geom.Point;
	
	import org.client.mainCore.ds.HashMap;
	
	/**
	 *角色属性变更操作管理 	
	 * @author lpp
	 */
	public class PlayerAttributeManager
	{
		public static function showSpriteStatChg( oldTotalStat:SpriteStat, newTotalStat:Vector.<AttributeItem> ):void
		{
			//因为属性图片缺少所以先不飘字了
//			return;
			
			if( oldTotalStat == null || newTotalStat == null )
				return;
			
			var newStat:SpriteStat = new SpriteStat();
			
		
			newStat.setData( newTotalStat );
			
			var oldMap:HashMap = oldTotalStat.getCloneMap();
			var newMap:HashMap = newStat.getCloneMap();
			
			var change:HashMap=new HashMap();
			var keys:Array=newMap.keys();
			var len:int=keys.length;
			var newV:int;
			var oldV:int;
			var key:int;
			var tmp:StatData;
			for (var i:int = 0; i < len; i++) 
			{
				key=keys[i];
				if (CharAttributeType.FIGHTING==key||CharAttributeType.HURT_SEC==key) 
				{
					continue;
				}
				
				tmp=newMap.getValue(key);
				newV=0;
				if (tmp) 
				{
					newV=tmp.value;
				}
				tmp=oldMap.getValue(key);
				oldV=0;
				if (tmp) 
				{
					oldV=tmp.value;
				}
				
				if (newV==oldV) 
				{
					continue;
				}
				change.add(key,AttValueConfig.getDisAttValue(key,newV-oldV));
			}
			FightFaceHelper.showPlayerBaseAttrChange(change);
		}
		
		
		/**
		 * 获取的增加的属性，累加描述
		 * @spriteStats 
		 * @opStr 字符串合并符 默认为\n 即换行
		 */		
		public static function getAddStatArrDes(attrInfoArr:*, opStr:String="\n"):String
		{
			var arr:Array = CharAttributeType.baseAttrIdArr;
			var len:int = arr.length;
			var atts:Object ={};
			
			var id:int;
			var type:int; 
			var value:int;
			for each(var attrInfo:SpriteStat in attrInfoArr)
			{
				for(var i:int=0; i< len; i++)
				{
					id = arr[i];
					type = CharAttributeType.getAtbtIDByName( id.toString() );
					value = attrInfo.getStatValue( type );
					if(value > 0)
					{
						if(!atts[id])atts[id] = 0;
						atts[id] += value;
					}
				}
			}
			
			var str:String = "";
			for (id in atts)
			{
				str += CharAttributeType.getCNName(id)+"+"+atts[id] + opStr;
			}
			return str;
		}
		
		/**
		 * 获取增加的属性描述
		 * @param step
		 * @param index
		 * @return 
		 */		
		public static function getAddStatDes(attrInfo:SpriteStat):String
		{
			var arr:Array = CharAttributeType.baseAttrIdArr;
			var len:int = arr.length;
			var str:String = "";
			
			for(var i:int=0; i< len; i++)
			{
				str = getSpriteStat(arr[i],attrInfo,str);
			}
			
			return str;
		}
		
		private static function getSpriteStat(type:int,attrInfo:SpriteStat,str:String):String
		{
			var attrCNNmae:String = CharAttributeType.getCNName(type);
			var attrENName:String = CharAttributeType.getAttrName(type);
			var attrValue:int;
			if(attrInfo.hasOwnProperty(attrENName))
			{
				attrValue = attrInfo[attrENName];
			}
			if(attrValue == 0)
			{
				return str;
			}
			
			return str + attrCNNmae + "+" + attrValue.toString() + "\n";
		}
		
		/**
		 * 获取增加的属性差描述
		 * @param step
		 * @param index
		 * @return 
		 */		
/*		public static function getAddStatDesChange(curStep:int,curIndex:int,nextStep:int,nextIndex:int):String
		{
			var curStat:SpriteStatProto = FeiShengCfgData.getAddStat(curStep,curIndex);
			var nextStat:SpriteStatProto = FeiShengCfgData.getAddStat(nextStep,nextIndex);
			var arr:Array = CharAttributeType.baseAttrIdArr;
			var len:int = arr.length;
			var str:String = "";
			
			for(var i:int=0; i< len; i++)
			{
				str = getSpriteStatChange(arr[i],nextStat,curStat,str);
			}
			
			return str;
		}	*/	
		
		private static function getSpriteStatChange(type:int,nextStat:Vector.<AttributeItem>,curStat:Vector.<AttributeItem>,str:String):String
		{
			var attrCNNmae:String = CharAttributeType.getCNName(type);
			var attrENName:String = CharAttributeType.getAttrName(type);
			var changeValue:int;
			if(nextStat.hasOwnProperty(attrENName))
			{
				changeValue = nextStat[attrENName];
				if(curStat.hasOwnProperty(attrENName))
				{
					changeValue -= curStat[attrENName]
				}
			}
			if(changeValue == 0)
			{
				return str;
			}
			
			return str + attrCNNmae + "+" + changeValue.toString() + "\n";
		}
		
		
		/**
		 * 通过对应的属性ID,和属性值value,设置对应的数据对象值(UserInfo)玩家角色专用
		 * @param attributeID
		 * @param attributeValue
		 * @param info
		 * 
		 */	
		//		public static function setAttributeUserValue(info:UserInfo,attributeType:uint,attributeValue:*):void
		//		{
		//			CharAttributeManager.setAttributeValue(info,attributeType,attributeValue);
		//			//以下为UserInfo里独有的属性,共有属性,请移步CharAttributeManager...
		//			if (null == info)
		//			{
		//				return;
		//			}
		//
		//			switch(attributeType)
		//			{
		//				case CharAttributeType.GIFT:
		//				{
		//					info.gifts = attributeValue;
		//					break;
		//				}
		//				case CharAttributeType.CHARGE_GOLD:
		//				{
		//					info.chargeGold = attributeValue;
		//					info.gold = info.chargeGold + info.systemGold;
		//					CharAttributeManager.dispatchEvent(info.id, CharAttributeType.GOLD, info.gold);
		//					break;
		//				}
		//				case CharAttributeType.SYSTEM_GOLD:
		//				{
		//					info.systemGold = attributeValue;
		//					info.gold = info.chargeGold + info.systemGold;
		//					CharAttributeManager.dispatchEvent(info.id, CharAttributeType.GOLD, info.gold);
		//					break;
		//				}
		//				case CharAttributeType.COPPER:
		//				{
		//					info.copper = attributeValue;
		//					EventManager.dispatchEvent(UserEvent.USER_MAIN_COPPER_CHANGE);
		//					break;
		//				}
		//				case CharAttributeType.GONG_XUN:
		//				{
		//					var diff:int = attributeValue - info.gongXun;
		//					if (diff > 0)
		//					{
		//						var attackFace:AttackFace = AttackFace.createAttackFace(StatType.GONG_XUN, diff, StatType.GONG_XUN_ZJ);
		//						Scene_TaggerHelper.showQueueTweenFromSceneChar(Scene.scene.getSceneObjByID(MainManager.actorID, SceneCharType.PLAYER) as SceneChar, attackFace, false, new Point(), new Point(), Scene_TaggerHelper.tweenDropCopper, false, Scene_TaggerHelper.onAtackFaceComplete);
		//					}
		//					info.gongXun = attributeValue;
		//					break;
		//				}
		//				case CharAttributeType.HONOUR:
		//				{
		//					info.honor = attributeValue;
		//					break;
		//				}
		//				case CharAttributeType.DUO_BAO_DIAN:
		//				{
		//					info.duoBaoDian = attributeValue;
		//					break;
		//				}
		//				case CharAttributeType.XIA_YI_DIAN:
		//				{
		//					info.xiaYiDian = attributeValue;
		//					break;
		//				}
		//				case CharAttributeType.FIGHT_POWER:
		//				{
		//					info.fightPower = attributeValue;
		//					break;
		//				}
		//				case CharAttributeType.LV:
		//				{
		//					info.lv = attributeValue;
		//					break;
		//				}
		//				case CharAttributeType.MAX_EXP:
		//				{
		//					info.expMax = attributeValue;
		//					break;
		//				}
		//				case CharAttributeType.PK:
		//					info.pk = attributeValue;
		//					break;
		//					
		//			}
		//			CharAttributeManager.dispatchEvent(info.id,attributeType,attributeValue);
		//		}
		
		
	}
}