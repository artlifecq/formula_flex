package com.rpgGame.appModule.maps
{
	import com.rpgGame.coreData.type.SceneCharType;
	
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.maps.Chuan;
	import org.mokylin.skin.app.maps.Locations;
	import org.mokylin.skin.app.maps.NpcName;
	import org.mokylin.skin.app.maps.NpcName2;
	
	import starling.display.Sprite;

	
	/**
	 * 大地图各种图标
	 */	
	public class BigMapIcon extends Sprite
	{
		
		private var _ico : UIAsset;
		private var _icnName:String;//显示名称
		private var _icontype:String;
		public function BigMapIcon(icontype:String,icoName:String="",pointx:int=0,pointy:int=0)
		{
			_icontype=icontype;
			_icnName=icoName;
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
				case SceneCharType.NPC:
					setNpcIco();
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
			var temp:SkinnableContainer = new SkinnableContainer();
			temp.x=-14;
			temp.y=-30;
			var skin:Locations = new Locations();
			temp.skin=skin;
			addChild(temp);
			
		}
		/**设置为传送点图标*/
		private function settTranportsIco():void
		{
			/*this._ico = new UIAsset();
			this._ico.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
			this._ico.styleName = "ui/app/maps/lan.png";
			this._ico.x = -7.5;
			this._ico.y = -7.5;
			this.addChild(this._ico);
			var chuan:UIAsset=new UIAsset();
			chuan.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
			chuan.styleName = "ui/app/maps/chuan.png";
			chuan.x = -15.5;
			chuan.y = -38;
			this.addChild(chuan);
			this.touchable = false;*/
			
			var temp:SkinnableContainer = new SkinnableContainer();
			temp.x=-12.5;
			temp.y=-40;
			var skin:Chuan = new Chuan();
			temp.skin=skin;
			addChild(temp);
			
		}
		/**设置为怪物点图标*/
		private function setMonsterIco():void
		{
			/*this._ico = new UIAsset();
			this._ico.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
			this._ico.styleName = "ui/app/maps/hong.png";
			this._ico.x = -7.5;
			this._ico.y = -7.5;
			this.addChild(this._ico);
			var icnNameLabel:Label = new Label();
			icnNameLabel.name = "ioc_name";
			icnNameLabel.maxWidth=icnNameLabel.width = 100;
			icnNameLabel.letterSpacing = 0;
			icnNameLabel.color = 0xD8D0C5;
			icnNameLabel.textAlign = "center";
			icnNameLabel.fontSize=15;
			icnNameLabel.nativeFilters = Fontter.filterObj["textFilterBlackGreen3"];
			icnNameLabel.isHtmlText=true;
			//icnNameLabel.
			icnNameLabel.htmlText =_icnName;
			icnNameLabel.x = -icnNameLabel.width/2;
			icnNameLabel.y = -27;
			
			this.addChild(icnNameLabel);
			this.touchable = false;*/
			
			var temp:SkinnableContainer = new SkinnableContainer();
			temp.x=-83;
			temp.y=-28;
			var skin:NpcName2 = new NpcName2();
			skin.lbl_name.htmlText=_icnName;
			temp.skin=skin;
			addChild(temp);
			
		}
		/**设置为NPC图标*/
		private function setNpcIco():void
		{
			/*this._ico = new UIAsset();
			this._ico.imageScaleMode = UIAsset.IMAGE_SCALE_MODE_NO_SCALE;
			this._ico.styleName = "ui/app/maps/lv.png";
			this._ico.x = -7.5;
			this._ico.y = -7.5;
			this.addChild(this._ico);
			var icnNameLabel:Label = new Label();
			icnNameLabel.name = "ioc_name";
			icnNameLabel.maxWidth=icnNameLabel.width = 100;
			icnNameLabel.letterSpacing = 0;
			icnNameLabel.color = 0x00B600;
			icnNameLabel.textAlign = "center";
			icnNameLabel.fontSize=15;
			icnNameLabel.nativeFilters = Fontter.filterObj["textFilterBlackGreen3"];
			icnNameLabel.isHtmlText=true;
			//icnNameLabel.
			icnNameLabel.htmlText =_icnName;
			icnNameLabel.x = -icnNameLabel.width/2;
			icnNameLabel.y = -27;
			
			this.addChild(icnNameLabel);
			this.touchable = false;*/
			var temp:SkinnableContainer = new SkinnableContainer();
			temp.x=-83;
			temp.y=-28;
			var skin:NpcName = new NpcName();
			skin.lbl_name.htmlText=_icnName;
			temp.skin=skin;
			addChild(temp);
		}
		
	}
}