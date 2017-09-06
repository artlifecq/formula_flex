package com.rpgGame.appModule.maps
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.type.SceneCharType;
	
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.maps.Chuan;
	import org.mokylin.skin.app.maps.Locations;
	import org.mokylin.skin.app.maps.NpcName;
	import org.mokylin.skin.app.maps.NpcName2;
	import org.mokylin.skin.app.maps.ThansName;
	
	import starling.display.Sprite;

	
	/**
	 * 大地图各种图标
	 */	
	public class BigMapIcon extends Sprite
	{
		
		private var _ico : UIAsset;
		private var _icnName:String;//显示名称
		private var _level:int;
		private var _icontype:String;
		public var icoName:Label;
		public function BigMapIcon(icontype:String,icoName:String="",level:int=0,pointx:int=0,pointy:int=0)
		{
			_icontype=icontype;
			_icnName=icoName;
			_level=level;
			this.x = pointx;
			this.y = pointy;
			setIconBit(icontype);
		}
		public function updatePos(pointx:Number,pointy:Number) : void 
		{
			this.x = pointx;
			this.y = pointy;
		}
		
		private function setIconBit(value:String):void
		{
			switch (value)
			{
				case SceneCharType.PLAYER:
					settMyIco();
					
					break;
				case SceneCharType.TRANS:
					settTranportsIco();
					
					break;
				case SceneCharType.MONSTER:
					setMonsterIco();
					break;
				case SceneCharType.COLLECT:
					setNpcIco();
					break;
				case SceneCharType.NPC:
					setNpcIco();
					//setMonsterIco();
					break;
			}
		}
		
		
		/**设置为玩家自己点图标*/
		private function settMyIco():void
		{
			/*this._ico = new UIAsset();
			this._ico.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
			this._ico.styleName = "ui/app/maps/dibiao.png";
			this._ico.x = -14;
			this._ico.y = -30;
			this.addChild(this._ico);
			this.touchable = false;
			*/
			
			/*var temp:SkinnableContainer = new SkinnableContainer();
			temp.x=-14;
			temp.y=-30;
			var skin:Locations = new Locations();
			temp.skin=skin;
			addChild(temp);*/
			
			var eftC:Inter3DContainer=new Inter3DContainer();
			eftC.playInter3DAt(ClientConfig.getEffect("ui_ditubiaoji"),0,0,0);
			addChild(eftC);
		}
		/**设置为传送点图标*/
		private function settTranportsIco():void
		{
			var temp:SkinnableContainer = new SkinnableContainer();
			temp.x=-62;
			temp.y=-35;
			var skin:ThansName = new ThansName();
			skin.lbl_name.htmlText="通往"+_icnName;
			temp.skin=skin;
			icoName=skin.lbl_name;
			addChild(temp);
			
		}
		/**设置为怪物点图标*/
		private function setMonsterIco():void
		{
			var temp:SkinnableContainer = new SkinnableContainer();
			temp.x=-45;
			temp.y=-35;
			var skin:NpcName2 = new NpcName2();
			skin.lbl_name.htmlText=_icnName;//"Lv."+_level+" "+
			temp.skin=skin;
			icoName=skin.lbl_name;
			addChild(temp);
			
		}
		/**设置为NPC图标*/
		private function setNpcIco():void
		{
			var temp:SkinnableContainer = new SkinnableContainer();
			temp.x=-45;
			temp.y=-45;
			var skin:NpcName = new NpcName();
			skin.lbl_name.htmlText=_icnName;
			temp.skin=skin;
			icoName=skin.lbl_name;
			addChild(temp);
		}
		
	}
}