package com.rpgGame.appModule.activety.zonghe.lijin
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.activety.Active_LiJin_JieSuan;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;

	/**
	 * 天降礼金结算面板
	 * @author YT
	 * 
	 */	
	public class LijinResultPanel extends SkinUIPanel
	{
		private var _skin:Active_LiJin_JieSuan;
		private var icoBgList:Vector.<UIAsset>;
		private var icoList:Vector.<IconCDFace>;
		public function LijinResultPanel()
		{
			_skin = new Active_LiJin_JieSuan();
			super(_skin);
			init();
		}
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			setReword();
		}
		override public function hide():void
		{
			super.hide();
		}
		override protected function onTouchTarget(target:DisplayObject):void 
		{
			super.onTouchTarget(target);
			switch(target.name){
				case "subbut":// 领取奖励
					hide();
					break;
			}
		}
		private function init():void
		{
			var i:int;
			icoBgList=new Vector.<UIAsset>();
			for(i=0;i<12;i++)
			{
				icoBgList.push(_skin["icon"+i]);
			}
			icoList=new Vector.<IconCDFace>();
			var ico:IconCDFace;
			//var spr:Sprite=_skin.toSprite();
			for(i=0;i<icoBgList.length;i++)
			{
				ico=IconCDFace.create(IcoSizeEnum.ICON_64);
				ico.showCD=false;
				ico.x=icoBgList[i].x;
				ico.y=icoBgList[i].y;
				ico.visible=false;
				icoBgList[i].visible=false;
				icoList.push(ico);
				_skin.iocn_list.addChild(ico);
				//spr.addChild(ico);
			}
			
			//icoBgList[0].visible=true;
			//icoList[0].visible=true;
			
		}
		/**设置奖励物品*/
		private function setReword():void
		{
			var i:int;
			for(i=0;i<icoBgList.length;i++)
			{
				icoBgList[i].visible=false;
				icoList[i].visible=false;
			}
			for(i=0;i<12;i++)
			{
				setIcon(icoList[i],201,10,icoBgList[i]);
				icoList[i].x=i*83;
				
			}
			_skin.iocn_list.x=(490-83*12+7)*0.5;
		}
		private function setIcon(icon:IconCDFace,tiemId:int,num:int,bg:UIAsset=null):void
		{
			var item:Q_item=ItemConfig.getQItemByID(tiemId);
			if(item!=null&&icon!=null)
			{
				icon.setIconResName(ClientConfig.getItemIcon(item.q_icon.toString(),IcoSizeEnum.ICON_64));
				icon.visible=true;
				if(bg)
				{
					bg.visible=true;
				}
				TaskUtil.setItemTips(icon,item,num);
			}
			
		}
		
	}
}