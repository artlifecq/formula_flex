package com.rpgGame.app.ui.main.smallmap
{
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.view.ui.tip.vo.BaseTipsInfo;
	import com.rpgGame.core.view.ui.tip.vo.TextTipsData;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.MapCountryMemeberInfo;
	import com.rpgGame.coreData.info.map.MapEmemyInfo;
	import com.rpgGame.coreData.info.map.MapFamilyMemberInfo;
	import com.rpgGame.coreData.info.map.MapIconType;
	import com.rpgGame.coreData.info.map.MapOfficerInfo;
	import com.rpgGame.coreData.info.map.MapTeamMemberInfo;
	import com.rpgGame.coreData.role.BaseEntityData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterBornData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.role.SceneTranportData;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import flash.geom.Point;
	
	import app.message.CountryOfficerPos;
	
	import away3d.events.Event;
	
	import feathers.controls.Label;
	import feathers.controls.UIAsset;
	import feathers.controls.text.Fontter;
	
	import starling.display.Sprite;
	import starling.text.TextFieldAutoSize;
	
	
	/**
	 * 地图角色图标
	 * @author Wing
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-06-02 下午3:05:12
	 */
	public class SmallMapRoleIcon extends Sprite
	{
		public var type : int;
		public var mapX : int;
		public var mapY : int;
		
		private var ico : UIAsset;
		private var text : Label;
		private var _data : BaseEntityData;
		private var _tipsInfo : BaseTipsInfo;
		private var _tipsData : TextTipsData;
		
		/**
		 * 设置点的色彩、半径
		 * @param color
		 * @param radius
		 * @author 卢国征  2015-4-28
		 */
		public function SmallMapRoleIcon(color : uint = 0xb18f6d, radius : int = 2)
		{
			super();
			touchable = true;
			touchGroup = true;
			text = new Label();
			text.autoSize = TextFieldAutoSize.NONE;
			text.maxWidth = text.width = 100;
			text.textAlign = "center";
			text.bold = false;
			text.color = StaticValue.YELLOW_TEXT;
			text.fontName = Fontter.DEFAULT_FONT_NAME;
			text.fontSize = Fontter.DEFAULT_FONT_SIZE;
			text.nativeFilters = ColorUtils.getDefaultStrokeFilter();
			addChild(text);
			text.touchable = false;
			text.x = -text.width * 0.5;
			text.y = -30;
			_tipsInfo = TargetTipsMaker.makeSimpleTextTips("");
			_tipsData = _tipsInfo.getData();
		}
		
		private function onIcoComplete(e : Event) : void
		{
			if (ico == null)
				return;
			
			ico.x = (-ico.width) * 0.5;
			ico.y = (-ico.height) * 0.5;
		}
		
		private function updateIco(icoUrl : String) : void
		{
			if (ico == null)
			{
				ico = new UIAsset();
				ico.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
				addChild(ico);
				ico.addEventListener(Event.COMPLETE, onIcoComplete);
			}
			
			ico.styleName = icoUrl;
			
			onIcoComplete(null);
		}
		
		/**
		 * 更新位置
		 * @param pos
		 * @author 卢国征  2015-4-28
		 */
		public function updatePos(pos : Point) : void
		{
			x = pos.x;
			y = pos.y;
		}
		
		public function set showText(value : Boolean) : void
		{
			if (text)
				text.visible = value;
		}
		
		public function removeMyself() : void
		{
			TipTargetManager.remove(this);
			
			if (parent != null)
				parent.removeChild(this);
		}
		
		public function setData(type : int, data : BaseEntityData, mapX : int, mapY : int) : void
		{
			this.type = type;
			this.mapX = mapX;
			this.mapY = mapY;
			this.visible = true;
			_data = data;
			var iconUrl : String;
			text.text = "";
			TipTargetManager.show(this, _tipsInfo);
			
			switch (type)
			{
				case MapIconType.BORN_NPC:
					var npcData : MonsterBornData = data as MonsterBornData;
					text.text = npcData.showInSmallMapType == 2 ? "" : npcData.name;
					if (npcData.showInSmallMapType == 3)
					{
						iconUrl = "";
					}
					else
					{
						
//						if (npcData.smallMapIcon)
//						{
//							iconUrl = ClientConfig.getMapIcon(npcData.smallMapIcon);
//						}
//						else
//						{
//							iconUrl = getMapNPCIcon();
//						}
						iconUrl = getMapNPCIcon();
					}
					updateIco(iconUrl);
					_tipsData.info = npcData.name + "<br/>" + npcData.x + "," + npcData.y;
					break;
				
				case MapIconType.BORN_TRANPORTS:
					var transportData : SceneTranportData = _data as SceneTranportData;
					var sceneName : String = MapDataManager.getMapName(transportData.destScene);
					text.text = transportData.showInSmallMapType == 2 ? "" : sceneName;
					if (transportData.showInSmallMapType == 3)
					{
						iconUrl = "";
					}
					else
					{
						iconUrl = getMapTranportsIcon();
					}
					updateIco(iconUrl);
					_tipsData.info = sceneName + "<br/>" + transportData.x + "," + transportData.y;
					break;
				
				case MapIconType.BORN_MONSTER:
					var bornMonsterData : MonsterBornData = _data as MonsterBornData;
					text.text = bornMonsterData.showInSmallMapType == 2 ? "" : bornMonsterData.name;
					if (bornMonsterData.showInSmallMapType == 3)
					{
						iconUrl = "";
					}
					else
					{
//						if(bornMonsterData.monsterType==4)
//							iconUrl = getMapNPCIcon();
//						else
						iconUrl = getMapMonsterIcon();
					}
					updateIco(iconUrl);
					_tipsData.info = bornMonsterData.name + "(" + bornMonsterData.level + "级)" + "<br/>" + bornMonsterData.x + "," + bornMonsterData.y;
					break;
				
				case MapIconType.BORN_OFFICER:
//					var officerinfo : MapOfficerInfo = _data as MapOfficerInfo;
//					iconUrl = getMapOfficerIcon(officerinfo.office);
//					updateIco(iconUrl);
//					_tipsData.info = officerinfo.name + "<br/>" + officerinfo.x + "," + officerinfo.y;
					break;
				case MapIconType.BORN_FAMILY:
					var familyinfo : MapFamilyMemberInfo = _data as MapFamilyMemberInfo;
					iconUrl = getMapFamilyIcon();
					updateIco(iconUrl);
					_tipsData.info = familyinfo.name + "<br/>" + familyinfo.x + "," + familyinfo.y;
					break;
				case MapIconType.BORN_COUNTRY_MEMBER:
					var countrymember : MapCountryMemeberInfo = _data as MapCountryMemeberInfo;
					iconUrl = getMapPlayerIcon(true);
					updateIco(iconUrl);
					_tipsData.info = countrymember.name + "<br/>" + countrymember.x + "," + countrymember.y;
					break;
				case MapIconType.BORN_ENEMY_MEMBER:
					var enemyinfo : MapEmemyInfo = _data as MapEmemyInfo;
					iconUrl = getMapPlayerIcon(false);
					updateIco(iconUrl);
					_tipsData.info = enemyinfo.name + "<br/>" + enemyinfo.x + "," + enemyinfo.y;
					break;
				case MapIconType.BORN_TEAMMATE:
					var teaminfo : MapTeamMemberInfo = _data as MapTeamMemberInfo;
					iconUrl = getMapTeamIcon();
					updateIco(iconUrl);
					_tipsData.info = teaminfo.name + "<br/>" + teaminfo.x + "," + teaminfo.y;
					break;
				case MapIconType.SCENE_MONSTER:
					//text.text = data;
					var sceneMonsterData : MonsterData = _data as MonsterData;
//					if(sceneMonsterData.monsterData.q_monster_type==4)
//						iconUrl = getMapNPCIcon();
//					else
					iconUrl = getMapMonsterIcon();
					updateIco(iconUrl);
					_tipsData.info = sceneMonsterData.name + "<br/>" + mapX + "," + mapY;
					break;
				
				case MapIconType.SCENE_PLAYER_MY_COUNTRY:
					var heroData : HeroData = _data as HeroData;
					iconUrl = getMapPlayerIcon(true);
					updateIco(iconUrl);
					_tipsData.info = heroData.name + "<br/>" + mapX + "," + mapY;
					break;
				
				case MapIconType.SCENE_PLAYER_ENEMY_COUNTRY:
					var enemyHeroData : HeroData = _data as HeroData;
					iconUrl = getMapPlayerIcon(false);
					updateIco(iconUrl);
					_tipsData.info = enemyHeroData.name + "<br/>" + mapX + "," + mapY;
					break;
				case MapIconType.SCENE_COLLECT:
					var colletcData:SceneCollectData=_data as SceneCollectData;
					iconUrl=getMapColletcIco(colletcData.id);
					updateIco(iconUrl);
					break;
			}
		}
		
		private function getMapColletcIco(id:int):String
		{
			return "ui/common/icon/caiji/jin_24.png";
		}
		
		public function get data() : BaseEntityData
		{
			return _data;
		}
		
		/**
		 * 返回小地图上面寻路路点的图标
		 * @return
		 */
		public static function getMapPathRoadIcon() : String
		{
			var url : String = "ui/app/maps/luxian.png";
			return url;
		}
		
		/**
		 * 得到地图上NPC图标
		 * @param type
		 * @return
		 *
		 */
		public static function getMapNPCIcon() : String
		{
			var url : String = "ui/mainui/map/npc.png";
			return url;
		}
		
		/**
		 * 得到地图上怪物图标
		 * @param type
		 * @return
		 *
		 */
		public static function getMapMonsterIcon() : String
		{
			var url : String = "ui/mainui/map/hongdian.png";
			return url;
		}
		
		/**
		 * 玩家
		 */
		public static function getMapPlayerIcon(isMyCountry : Boolean) : String
		{
			var url : String;
			if (isMyCountry)
				url = "ui/mainui/map/lvdian.png";
			else
				url = "ui/mainui/map/chengdian.png";
			return url;
		}
		
		/**
		 * 队伍
		 */
		public static function getMapTeamIcon() : String
		{
			var url : String = "ui/mainui/map/flag/ben_dui.png";
			return url;
		}
		
		public static function getMapFamilyIcon() : String
		{
			var url : String = "ui/mainui/map/di.png";
			return url;
		}
		
		/**
		 * 传送门
		 */
		public static function getMapTranportsIcon() : String
		{
			var url : String = "ui/mainui/map/flag/chuan.png";
			return url;
		}
		
		public static function getMapOfficerIcon(value : int) : String
		{
			var url : String = "";
			switch (value)
			{
				case CountryOfficerPos.POS_KING:
					url = "ui/mainui/map/flag/wang.png";
					break;
				case CountryOfficerPos.POS_QUEEN:
					url = "ui/mainui/map/flag/hou.png";
					break;
				case CountryOfficerPos.POS_TAI_SHI:
					url = "ui/mainui/map/flag/shi.png";
					break;
				case CountryOfficerPos.POS_DU_DU:
					url = "ui/mainui/map/flag/du.png";
					break;
				case CountryOfficerPos.POS_CHENG_XIANG:
					url = "ui/mainui/map/flag/xiang.png";
					break;
				case CountryOfficerPos.POS_TAI_WEI:
					url = "ui/mainui/map/flag/wei_1.png";
					break;
				case CountryOfficerPos.POS_JIN_WEI:
					url = "ui/mainui/map/flag/wei.png";
					break;
			}
			return url;
		}
	}
}
