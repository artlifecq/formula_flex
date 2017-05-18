package com.rpgGame.app.utils
{
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.app.manager.mount.MountEquipmentManager;
	import com.rpgGame.app.manager.mount.MountManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.cfg.mount.MountConfigData;
	import com.rpgGame.coreData.cfg.mount.MountUnitData;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.info.face.IBaseFaceInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.mount.MountInfoData;
	import com.rpgGame.coreData.lang.LangMount;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.type.ShopType;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.type.item.GridBGType;
	
	import flash.geom.Point;
	
	import app.message.GoodsType;
	
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	
	import starling.display.DisplayObject;
	
	/**
	 * 物品格子、技能格子的一键设置类
	 * @author 卢国征
	 * 
	 */	
	public class FaceUtil
	{
		public function FaceUtil()
		{
		}
		//----------------------------------------------------------
		
		
		public static function getUnItemInfo( type:int, count:int ):ClientItemInfo
		{
			var itemInfo:ClientItemInfo = new ClientItemInfo();
			itemInfo.cfgId = 1111;
			itemInfo.name = ShopType.getMoneyStrByType( type );
			itemInfo.count = count;
			return itemInfo;
		}
		
		/**
		 * 设置非物品的物品格子
		 * @param grid
		 * @param itemInfo
		 * 
		 */		
		public static function SetUnItemGrid( grid:IconCDFace, itemInfo:ClientItemInfo, type:int ):void
		{ 
			var size:int = grid.iconSize;
			grid.setIconResName( ClientConfig.getItemIcon( ShopType.getMoneyIco( type ), size ) );
			grid.count = itemInfo.count;
			grid.showQuality( itemInfo.quality );
			grid.faceInfo = itemInfo;
			//			grid.setIsShowCdTm(true);
			
			TipTargetManager.show( grid, TargetTipsMaker.makeSimpleTextTips( "$<br/>数量：$", [ itemInfo.getSelfName(), itemInfo.count] )) ;
		}
		
		//----------------------------------------------------------
		
		/**
		 * 转化技能数据为格子、TIPS数据集
		 * @param skillData
		 * @param shortcut
		 * @return 
		 * 
		 */		
		public static function chanceSpellToFaceInfo( skillData:Q_skill_model ):BaseFaceInfo
		{
			var info:BaseFaceInfo = new BaseFaceInfo( skillData.q_skillID,skillData.q_skillID, FaceTypeEnum.SKILL );
			info.icoName = skillData.q_icon;
			info.name = skillData.q_skillName;
			info.data = skillData;
			return info;
		}
		
		//---------------------------------------------
		/**
		 * 设置物品格子 
		 * @param grid 格子
		 * @param itemInfo 物品数据
		 * @param isTips 是否需要tips显示<br><br>
		 * 
		 * 方法未完成，慎用。。。。<br>
		 * 期望做成可以一键完成所有物品的设置，如TIPS、图标、CD、数量等
		 */		
		public static function SetItemGrid( grid:IconCDFace, itemInfo:ClientItemInfo, isTips:Boolean = true ):void
		{
			if(!grid)
				return;
			
			grid.clear();
			
			if(!itemInfo)
			{
				TipTargetManager.remove( grid );
				grid.selectImgVisible = false;
				return;
			}
			
			var size:int = grid.iconSize;
			var icon:String = itemInfo.icoName;
			if(!icon)icon = "";
			grid.setIconResName( ClientConfig.getItemIcon(icon, size ) );
			grid.count = itemInfo.count;
			grid.showQuality( itemInfo.quality );
			grid.faceInfo = itemInfo;
			grid.setIsShowCdTm(false);
			grid.setIsShowCdCircle(true);
			grid.sortLayer();
			grid.setIsBind(itemInfo.binded);
			grid.selectImgVisible = true;
			
			if(itemInfo is EquipInfo)
			{
				grid.setIsWear( RoleEquipmentManager.equipIsWearing(itemInfo));
			}
			var hero:HeroData=MainRoleManager.actorInfo;
			switch( itemInfo.type )
			{
				case GoodsType.EQUIPMENT://装备
				case GoodsType.EQUIPMENT1://装备
				case GoodsType.EQUIPMENT2://装备
					grid.setLV(itemInfo.qItem.q_levelnum);
					break;
				default:
					break;
			}
			
			if( isTips )
			{
				switch( itemInfo.type )
				{
					case GoodsType.EQUIPMENT://装备
					case GoodsType.EQUIPMENT1://装备
					case GoodsType.EQUIPMENT2://装备
						TipTargetManager.show( grid, TargetTipsMaker.makeTips( TipType.EQUIP_TIP, itemInfo ) );
						if(itemInfo.containerID==ItemContainerID.BackPack){
							if(hero.job!=itemInfo.qItem.q_job&&itemInfo.qItem.q_job!=0){
								grid.setJobState(AssetUrl.EQUIP_JOB_NO);
							}else{
								var equipItemInfo:ClientItemInfo=RoleEquipmentManager.instance.getEquipInfoByIndex(itemInfo.qItem.q_kind);
								var equipFight:int;
								if(equipItemInfo){
									equipFight=equipItemInfo.itemInfo.fightPower;
								}
								var targetFight:int=itemInfo.itemInfo.fightPower;
								if(equipFight>targetFight){
									grid.setJobState(AssetUrl.EQUIP_JOB_DOWN);
								}else if(equipFight<targetFight){
									grid.setJobState(AssetUrl.EQUIP_JOB_UP);
								}else{
									grid.setJobState(null);
								}
							}
						}
						break;
					/*case GoodsType.BEAST_CARD://兽牌
						grid.setIsBind(itemInfo.binded);
						TipTargetManager.show( grid, TargetTipsMaker.makeTips( TipType.MOUNT_BEAST_CARD_TIP, itemInfo ) );
						break;*/
					default:
						TipTargetManager.show( grid, TargetTipsMaker.makeTips( TipType.ITEM_TIP, itemInfo ) );
						break;
				}
			}
			else
				TipTargetManager.remove( grid );
		}
		
		/**
		 * 设置Buff格子
		 * @param grid
		 * @param data
		 * 
		 */		
		public static function setBuffGrid( grid:IconCDFace, data:BuffData, isTips:Boolean = false ):void
		{
			grid.clear();
			
			var size:int = grid.iconSize;
			grid.showQuality( -1 );
			grid.faceInfo = data;
			grid.setIconResName( ClientConfig.getBuffIcon( data.icoName, size ) );
			grid.count = data.curtStackCount;
			grid.setIsShowCdTm( true );
			grid.sortLayer();
			
			if( isTips )
				TipTargetManager.show( grid, TargetTipsMaker.makeTips( TipType.BUFF_TIP, data,false,new Point(grid.x,grid.y)) );
			else
				TipTargetManager.remove( grid );
		}
		
		/**
		 * 设置技能格子
		 * @param grid
		 * @param data
		 * 
		 */		
		public static function SetSkillGrid( grid:IconCDFace, data:BaseFaceInfo, isTips:Boolean = false ):void
		{
			grid.clear();
			
			var size:int = grid.iconSize;
//			grid.showQuality( -1 );
			grid.faceInfo = data;
			grid.setIconResName( ClientConfig.getSkillIcon( data.icoName, size ) );
			grid.setIsShowCdTm( true );
//			grid.setQualityImageIconPoint( -2, -2 );
			grid.sortLayer();
			
			if( isTips )
			{
				var skilldata:Q_skill_model = data.data as Q_skill_model;
				if(skilldata.q_trigger_type == 1)
				{
					TipTargetManager.show( grid, TargetTipsMaker.makeTips( TipType.SPELL_TIP, data,false,new Point(grid.x,grid.y)) );
				}else{
					TipTargetManager.show( grid, TargetTipsMaker.makeTips( TipType.PASSIVESKILL_TIP, data,false,new Point(grid.x,grid.y)) );
				}
				
			}else
				TipTargetManager.remove( grid );
		}
		
		/**
		 * 把Skin中的一个UIAsset转换成一个 DragDropItem
		 * @param oldGrid
		 * @param size
		 * @param index
		 * @return 
		 * 
		 */		
		public static function creatDragDropItemByUIAsset(oldGrid:UIAsset, size:int=46, index:int=0):DragDropItem
		{
			var grid:DragDropItem = new DragDropItem( size, index);
			var icon:String = oldGrid.styleName;
			grid.setBg( GridBGType.GRID_SIZE_46 );
			grid.bgImage.styleName = icon;
			grid.bgImage.width = oldGrid.width;
			grid.bgImage.height = oldGrid.height;
			grid.dragAble = true;
			grid.x = oldGrid.x;
			grid.y = oldGrid.y;
			grid.name = oldGrid.name;
			grid.visible = oldGrid.visible;
			grid.bgImage.width = grid.width = oldGrid.width;
			grid.bgImage.height = grid.height = oldGrid.height;
			grid.setIconPoint(0,0);
			oldGrid.parent.addChild(grid);
			oldGrid.removeFromParent();
			return grid;
		}
		
		/**
		 * 把Skin中的一个UIAsset转换成一个 IconCDFace
		 * @param oldGrid
		 * @param size
		 * @param index
		 * @return 
		 * 
		 */		
		public static function creatIconCDFaceByUIAsset(oldGrid:UIAsset, size:int=46, alpha:Number=1,iconX:int=0,iconY:int=0):IconCDFace
		{
			var grid:IconCDFace = new IconCDFace( size);
			var icon:String = oldGrid.styleName;
			grid.setBg( GridBGType.GRID_SIZE_46,alpha );
			grid.bgImage.styleName = icon;
			grid.x = oldGrid.x;
			grid.y = oldGrid.y;
			grid.name = oldGrid.name;
			grid.visible = oldGrid.visible;
			grid.bgImage.width = grid.width = oldGrid.width;
			grid.bgImage.height = grid.height = oldGrid.height;
			grid.setIconPoint(iconX,iconY);
			grid.name = oldGrid.name;
			oldGrid.parent.addChild(grid);
			oldGrid.removeFromParent();
			
			return grid;
		}
		
		/**
		 * 设置格子物品数据 
		 * @param grid 格子
		 * @param data 数据
		 * @param isTips 是否需要显示tips
		 * 
		 */		
		public static function setGridData(grid:IconCDFace, data:IBaseFaceInfo, isTips:Boolean = false ):void
		{
			if( data == null )
				return;
			
			if(data is ClientItemInfo)
				SetItemGrid(grid, data as ClientItemInfo, isTips);
			else
				SetSkillGrid(grid, data as BaseFaceInfo, isTips);
		}
		
		//-------------------------------------------------
		public static var backpackBtn:DisplayObject;
		
		/**
		 * 把指定格子里的图标飞到快捷栏上背包按扭
		 * @param prizeGrid
		 * @param offPosx		飞到按扭的偏移量
		 * @param offPosy
		 * 
		 */			
		public static function flyIcoToBackPack( prizeGrid:IconCDFace,offPosx:int = 0,offPosy:int = 0):void
		{
			if(prizeGrid == null)
				return;
			
			var beginDisplay:IconCDFace = prizeGrid;
			var tragetDisplay:DisplayObject = backpackBtn;
			if( tragetDisplay == null ) 
				return;
			
			var ico:UIAsset = new UIAsset();
			ico.styleName = beginDisplay.iconResURL;
			
			StarlingLayerManager.hintUILayer.addChild( ico );
			
			var posPoint:Point = new Point( beginDisplay.x, beginDisplay.y );
			posPoint = beginDisplay.localToGlobal( posPoint );
			ico.x = posPoint.x + 4;
			ico.y = posPoint.y + 4;
			
			var endPoint:Point = tragetDisplay.localToGlobal( new Point() );
			
			TweenLite.to( ico, 1, { x:endPoint.x + offPosx, y:endPoint.y + offPosy,onComplete:flyImageEnd, onCompleteParams:[ico] } )
		}
		
		public static function flyImageEnd( ico:UIAsset ):void
		{
			TweenLite.killTweensOf( ico );
			
			if( ico.parent != null )
				ico.parent.removeChild( ico );
			
			ico.dispose();
			ico = null;
		}
		//--------------------------------------------------------------
		
		/**
		 * 转化坐骑数据为格子、TIPS数据集
		 * @param skillData
		 * @param shortcut
		 * @return 
		 * 
		 */		
		public static function chanceMountToFaceInfo( mountData:MountInfoData ):BaseFaceInfo
		{
			var info:BaseFaceInfo = new BaseFaceInfo( mountData.id, mountData.id, FaceTypeEnum.MOUNT );
			var mountUnitData:MountUnitData = MountConfigData.getMountDataById( mountData.id );
			if( mountUnitData != null )
			{
				//坐骑前缀 
				var mountPrefixTypeStr:String = MountManager.getPrefixType( mountUnitData.prefixType );
				//名字
				var mountName:String = LanguageConfig.getText( LangMount.MOUNT_TIPS_1, mountPrefixTypeStr + mountUnitData.name );
			}
			
//			info.icoName = AssetUrl.MOUNT_IMG;
			info.name = mountName;
			info.data = mountData;
			return info;
		}
		
		/**
		 * 设置坐骑格子
		 * @param grid 格子
		 * @param data face对象的基础根类
		 * @param isTips 是否需要tips
		 * 
		 */		
		public static function SetMountGrid( grid:IconCDFace, data:BaseFaceInfo, isTips:Boolean=true ):void
		{
			grid.clear();
			if( data == null )
			{
				grid.showQuality( -1 );
				grid.faceInfo = null;
				grid.setIconResName( "" );
				TipTargetManager.remove( grid );
				return;
			}
			var size:int = grid.iconSize;
			grid.showQuality( -1 );
			grid.faceInfo = data;
			
			var mountData:MountInfoData = data.data as MountInfoData;
			if( mountData != null )
			{
				//坐骑单元数据
				var mountUnitData:MountUnitData = MountConfigData.getMountDataById( mountData.id );
				if( mountUnitData != null )
					grid.setIconResName( ClientConfig.getMountIconByMountSpeciesId( mountUnitData.speciesId ) );
			}
			grid.selectImgVisible = false;
			grid.sortLayer();
			if( isTips )
				TipTargetManager.show( grid, TargetTipsMaker.makeTips( TipType.MOUNT_TIP, data, false, new Point( grid.x, grid.y ) ) );
			else
				TipTargetManager.remove( grid );
		}
	}
}
