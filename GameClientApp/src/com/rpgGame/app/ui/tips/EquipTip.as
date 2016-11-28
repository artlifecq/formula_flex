package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.cfg.StatNameCfgData;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.stat.StatData;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import app.message.Quality;
	import app.message.SpriteStatProto;
	
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.ds.HashMap;
	import org.mokylin.skin.app.tips.EquipTipsSkin;
	
	import starling.display.DisplayObject;

	/**
	 * 装备tips 
	 * @author Mandragora
	 * 
	 */	
	public class EquipTip extends SkinUI implements ITip
	{
		private var _itemTip:EquipTipsSkin;
		private const lineHeight:int=20;
//		private const MIN_STAT:Array=[StatType.PHYSICAL_ATTACK_LOWER, StatType.MAGICAL_ATTACK_LOWER];//10,13
//		private const MAX_STAT:Array=[StatType.PHYSICAL_ATTACK_UPPER, StatType.MAGICAL_ATTACK_UPPER];//11,14
		private var spriteStatLines:Vector.<StatLine>;
		private var statPool:Vector.<StatLine>;
		/** 索引 **/
		private var childIndex:int=0;
		/** 装备品质底图 **/
		private var qualityBgs:HashMap;
		/** 装备信息 **/
		private var _itemInfo:EquipInfo;
		/** 装备格子 **/
		private var _iconFace:IconCDFace;
		/** 基础属性Title **/
		private var baseStatTitle:Group;
		/** 随机属性Title **/
		private var randomStatTitile:Group;
		/** 强化属性Title **/
		private var generalStatTitle:Group;
		/** 武器名字 **/
		private var generalName:Label;
		/** 装备套装名字 **/
		private var generalTaozName:Label;
		/** 基础属性group **/
		private var baseGroup:Group;
		/** 强化星星等级 **/
		private var equipRefineTimes : EquipRefineTimesBar;
		private static var _instance:EquipTip=null;

		public function EquipTip()
		{
			_itemTip=new EquipTipsSkin();
			super(_itemTip);
			initTip();
		}

		public static function get instance():EquipTip
		{
			if (null == _instance)
			{
				_instance=new EquipTip();
			}
			return _instance;
		}
		
		/**
		 * 初始化 
		 * 
		 */		
		private function initTip():void
		{
			//装备格子
			_iconFace=new IconCDFace(IcoSizeEnum.SIZE_60);
			addChild(_iconFace);
			_iconFace.setBg(GridBGType.GRID_SIZE_60);
			_iconFace.x=30;
			_iconFace.y=67;
			_iconFace.setIconPoint(8, 8);

			baseGroup=_itemTip.baseGroup;

			spriteStatLines=new Vector.<StatLine>();
			statPool=new Vector.<StatLine>();
			
			//初始化品质底图
			qualityBgs=new HashMap();
			qualityBgs.add(Quality.PURPLE, _itemTip.qualityBg2);
			qualityBgs.add(Quality.WHITE, _itemTip.qualityBg3);
			qualityBgs.add(Quality.YELLOW, _itemTip.qualityBg1);
			qualityBgs.add(Quality.BLUE, _itemTip.qualityBg0);
			qualityBgs.add(Quality.GREEN, _itemTip.qualityBg4);
			
			//修理价格
			_itemTip.xiuliCostGroup.visible = false;
			//绑定还是非绑定
			_itemTip.isBind.visible = false;
			
			equipRefineTimes = new EquipRefineTimesBar();
			equipRefineTimes.x = _itemTip.refine.x;
			equipRefineTimes.y = _itemTip.refine.y;
			addChild(equipRefineTimes);
		}

		/**
		 * 设置装备tips数据 
		 * @param data
		 * 
		 */		
		public function setTipData(data:*):void
		{
//			_itemInfo=data as EquipInfo;
//
//			if (_itemInfo == null)
//				return;
//
//			var statline:StatLine;
//			while (spriteStatLines.length)
//			{
//				statline=spriteStatLines.shift();
//				if (statline && statline.parent)
//					statline.parent.removeChild(statline);
//				statPool.push(statline);
//			}
//			equipRefineTimes.setRefineTimes(_itemInfo.refined_times);
//
//			//清楚数据,基础属性、随机属性、名将属性、XXX的武器、套装
//			baseGroup.removeChild(_itemTip.baseStatTitle);
//			baseGroup.removeChild(_itemTip.randomStatTitile);
//			baseGroup.removeChild(_itemTip.generalStatTitle);
//			baseGroup.removeChild(_itemTip.generalName);
//			baseGroup.removeChild(_itemTip.generalTaozName);
//
//			spriteStatLines.length=0;
//
//			//设置装备格子信息
//			FaceUtil.SetItemGrid(_iconFace, _itemInfo, false);
//			//装备名字
//			_itemTip.labName.htmlText=ItemQualityType.getHtmlEquipQualityEvaluteName(_itemInfo.refined_times, _itemInfo.quality, _itemInfo.name, _itemInfo.evaluate);
//			//装备品质
//			setQualityVisable(_itemInfo.quality);
//			//绑定还是非绑定
////			_itemTip.isBind.visible = _itemInfo.isEquipBind;
//			var sex : String = _itemInfo.sex?"("+SexType.getName(_itemInfo.sex)+")":"";
//			//装备类型
////			_itemTip.equipType.text=_itemInfo.race?RaceCfgData.getRaceName(_itemInfo.race):EquipTypeNameCfgData.getTypeName(_itemInfo.equipType)+sex;
//			//装备位置
////			_itemTip.equipType0.text=EquipTypeNameCfgData.getTypeName(_itemInfo.equipType);
//			//装备等级
//			_itemTip.equipLvl.text=_itemInfo.level + "";
//			//耐久度
//			_itemTip.equipNaijiu.text=(_itemInfo.durability - _itemInfo.used_durability) + "/" + _itemInfo.durability;
//
//			childIndex=-1;
//			
//			//获取基础属性
//			if (_itemInfo.baseSpriteStat.getStatValues().length > 0)
//			{
//				baseGroupAddchild(_itemTip.baseStatTitle);
//				SpriteStatLineUtil.createSpriteStatLine(StatLine,baseGroupAddchild,_itemInfo.baseSpriteStat,true,_itemInfo.refinedStat);
//			}
//
//			//获取随机属性
//			if (_itemInfo.randomSpriteStat.getStatValues().length > 0)
//			{
//				baseGroupAddchild(_itemTip.randomStatTitile);
//				SpriteStatLineUtil.createSpriteStatLine(StatLine,baseGroupAddchild,_itemInfo.randomSpriteStat);
//			}
//			
//			//获取套装属性
////			var equipGeneralTaoz:EquipmentGeneralTaozDataProto=EquipmentGeneralCfgData.getGeneralTaozData(_itemInfo.general_taoz_id);
////			if (equipGeneralTaoz)
////			{
////				baseGroupAddchild(_itemTip.generalStatTitle);
////				baseGroupAddchild(_itemTip.generalName);
////				baseGroupAddchild(_itemTip.generalTaozName);
////				_itemTip.generalName.text=equipGeneralTaoz.name + "的" + EquipTypeNameCfgData.getTypeName(_itemInfo.type);
////				_itemTip.generalTaozName.htmlText=LanguageConfig.getText(LangEquip.GENERAL_TAOZ_NAME, equipGeneralTaoz.name, EquipmentGeneralCfgData.getGeneralTaozAddSpriteStatsLenght(equipGeneralTaoz));
////				var spritestatMap:HashMap=EquipmentGeneralCfgData.getGeneralTaozAddSpriteStats(equipGeneralTaoz);
////				if (spritestatMap.length > 0)
////					updateSpriteStateLabel(spritestatMap);
//			}
//
//			//描述
//			_itemTip.labDecTitle.text=_itemInfo.desc ? _itemInfo.desc : "没有填写描述";
//			_itemTip.labDecTitle.height = _itemTip.labDecTitle.bounds.height;
//			//评分
//			_itemTip.pingfen.text=_itemInfo.fighting_amount + "";
//			//出售价格
//			_itemTip.sell.htmlText=MoneyUtil.getHtmlMoneyString( _itemInfo.sellPrize, true, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_1, StaticValue.COLOR_CODE_26, StaticValue.COLOR_CODE_16, StaticValue.COLOR_CODE_14 );
//			var display:DisplayObject;
//			var height:int=0;
//			var index:int=0;
//			
//			//计算baseGroup的高度
//			for (; index < baseGroup.numChildren; index++)
//			{
//				display=baseGroup.getChildAt(index);
//				if ( display )
//				{
//					if( display is Label )//重新计算lab的真实高度 2016-06-21 陈鹉光 改
//					{
//						display.height = (display as Label).textBounds.height;
//					}
//					height+=display.height;
//				}
//			}
//			
//			//装备tips背景高度
//			_itemTip.imgBG.height=baseGroup.y + height + lineHeight;
		}

		/**
		 * 移除装备tips 
		 * 
		 */		
		public function hideTips():void
		{
		}

		/**
		 * 获取装备tips默认的背景高度 
		 * @return 
		 * 
		 */		
		public override function get height():Number
		{
			return _itemTip.imgBG.height;
		}

		/**
		 * 装备属性 
		 * @param spriteStateMap
		 * 
		 */		
		private function updateSpriteStateLabel(spriteStateMap:HashMap):void
		{
			var i:int=0;
			var len:int;
			var label:StatLine;
			var index:int;
			var spriteState:SpriteStatProto;
			if (!spriteStateMap)
				return;
			var spriteStates:Array=spriteStateMap.getValues();
			var spriteStateInfo:SpriteStat=new SpriteStat();
			;
			var statData:StatData;
			var statDatas:Array;
			var statValue:String;
			for each (spriteState in spriteStates)
			{
				if (!spriteState)
					continue;
				spriteStateInfo.setData(spriteState);
				statDatas=spriteStateInfo.getStatValues();
				len=statDatas.length;
				i=0;
				for (; i < len; i++)
				{
					statData=statDatas[i];
					label=new StatLine();
					baseGroupAddchild(label);
					statValue=statData.value ? statData.value.toString() : statData.percent + "%";
					label.setData(StatNameCfgData.getStatName(statData.type), statValue, spriteStateMap.key(spriteState));
					index++;
				}
			}
		}

		/**
		 * 设置装备品质 
		 * @param q
		 * 
		 */		
		private function setQualityVisable(q:int):void
		{
			var uiasset:UIAsset;
			for each (uiasset in qualityBgs.getValues())
			{
				uiasset.visible=false;
			}
			uiasset=qualityBgs.getValue(q);
			if (uiasset)
				uiasset.visible=true;
		}

		/**
		 * 添加一条属性 
		 * @param display
		 * 
		 */		
		private function baseGroupAddchild(display:DisplayObject):void
		{
			childIndex++;
			baseGroup.addChildAt(display, childIndex);
			if(display is StatLine)
				spriteStatLines.push(display);
		}
	}
}
import com.rpgGame.core.ui.SpriteStatLine;
import com.rpgGame.coreData.cfg.LanguageConfig;
import com.rpgGame.coreData.info.stat.StatData;
import com.rpgGame.coreData.lang.LangEquip;

import feathers.controls.UIAsset;

import org.client.mainCore.ds.HashMap;
import org.mokylin.skin.app.equip.EquipGeneralStatLineSkin;

import starling.display.Sprite;

/**
 * 属性条 
 * @author 陈鹉光
 * 
 */
class StatLine extends SpriteStatLine
{
	public var skin:EquipGeneralStatLineSkin;

	public function StatLine()
	{
		skin=new EquipGeneralStatLineSkin();
		super(skin);
	}

	/**
	 * 设置单条属性条数据 
	 * @param statName  名字
	 * @param statAdd 增加的属性
	 * @param taozCount 套装数 XXXX件
	 * 
	 */	
	public function setData(statName:String, statAdd:String, taozCount:int):void
	{
		skin.statName.text=statName;
		skin.statAdd.text=statAdd;
		skin.taozCount.htmlText=LanguageConfig.getText(LangEquip.GENERAL_TAOZ_STAT, taozCount);
	}

	/**
	 * 设置基础属性 
	 * @param str
	 * @param stat
	 * 
	 */	
	override public function setBaseStatStr(str:String,stat:StatData):void
	{
		skin.statName.htmlText=str;
	}
	
	/**
	 * 设置其他属性 
	 * @param isAdd
	 * @param addValue
	 * 
	 */	
	override public function setOtherStatStr(isAdd:Boolean,addValue:Number):void
	{
		
	}
}

/**
 * 强化星星数 
 * @author 陈鹉光
 * 
 */
class EquipRefineTimesBar extends Sprite
{
	/** 强化图标宽度，位置排序用 **/
	private const ASSET_WIDTH : int = 21;
	/** 强化图标哈希表 **/
	private var _assetMap : HashMap;
	/** 索引 **/
	private var index:int = 0;
	
	public function EquipRefineTimesBar()
	{
		super();
		_assetMap = new HashMap();
	}
	
	/**
	 * 设置强化等级 
	 * @param refine  强化等级， 0表示没有强化
	 * 
	 */	
	public function setRefineTimes(refine:int):void
	{
//		var refineTimes : EquipRefineTimesInfo = EquipRefineTimesCfgData.getInfoByRefineTimes(refine);
//		if(!refineTimes)
//		{
//			clearAllAsset();
//			return;
//		}
//		index = 0;
//		addAsset(refineTimes.taiyang,AssetUrl.EQUIP_REFINT_TIMES_TAI_YANG);
//		addAsset(refineTimes.yueliang,AssetUrl.EQUIP_REFINE_TIMES_YUE_LIANG);
//		addAsset(refineTimes.xing,AssetUrl.EQUIP_REFINE_TIMES_XING);
//		for(index;index<_assetMap.length;index++)
//		{
//			clearAssetByIndex(index);
//		}
	}
	
	/**
	 * 添加一个强化图标显示 
	 * @param max
	 * @param styleName
	 * 
	 */	
	private function addAsset(max:int,styleName:String):void
	{
		var asset : UIAsset;
		var i : int = 0;
		for (i=0;i<max;i++)
		{
			asset = getAssetByIndex(index);
			asset.styleName = styleName;
			asset.x = index * ASSET_WIDTH;
			index++;
			addChild(asset);
		}
	}
	
	/**
	 * 通过索引，清除一个强化图标 
	 * @param index
	 * 
	 */	
	private function clearAssetByIndex(index:int):void
	{
		var asset : UIAsset = _assetMap.getValue(index);
		if(asset)
			asset.visible = false;
	}
	
	/**
	 * 清除所有强化图标 
	 * 
	 */	
	public function clearAllAsset():void
	{
		_assetMap.eachKey(clearAssetByIndex);
	}
	
	/**
	 * 获取一个强化图标 
	 * @param index
	 * @return 
	 * 
	 */	
	private function getAssetByIndex(index:int):UIAsset
	{
		var asset : UIAsset;
		if(index<_assetMap.length)
		{
			asset = _assetMap.getValue(index);
			asset.visible = true;
			return asset;
		}
		asset = new UIAsset();
		_assetMap.add(index,asset);
		return asset;
	}
}
