package  com.rpgGame.appModule.openActivity.plat37
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.GlobalFunction;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.main.openActivity.BaseActivityMainPanel;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	import com.rpgGame.coreData.info.openActivity.EnumCampPanelType;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	import org.mokylin.skin.app.showgirl.ShowGirl_Skin;
	
	import starling.display.Image;
	import starling.textures.IStarlingTexture;
	import starling.textures.TextureFactory;

	public class P37SuperVIPExt extends BaseActivityMainPanel
	{
		private var girlQQ:String;
		private var girlImageUrl:String
		private var girlBit:Image;
		private var  loader:Loader=new Loader();
		private var _skin:ShowGirl_Skin;
		private var FloatingText:Object;
		public function P37SuperVIPExt()
		{
			_skin=new ShowGirl_Skin();
			super(EnumCampPanelType.M_SUPER_VIP_37,_skin);
			registerListeners();
			loadGirl();
			RefreshQQInfo(false);
		}
		override protected function setData(hash:HashMap):void
		{
			var arrs:Array=hash.values();
			if (arrs&&arrs.length>0) 
			{
				var vos:Vector.<ActivityVo>=arrs[0];
				_skin.btnChongzhi.visible=false;
				_skin.btnLingqu.visible=false;
				if (vos&&vos.length>0) 
				{
					var vo:ActivityVo=vos[0];
					if (vo.status==0) 
					{
						_skin.btnLingqu.visible=true;
						TouchableUtil.gray(_skin.btnLingqu);
						RefreshQQInfo(true);
					}
					else if (vo.status==1) 
					{
						_skin.btnLingqu.visible=true;
						TouchableUtil.ungray(_skin.btnLingqu);
						RefreshQQInfo(true);
					}
					else 
					{
						_skin.btnChongzhi.visible=true;
						RefreshQQInfo(false);
					}
				}
			}
		}
		private  function registerListeners():void
		{
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIoerror);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError)
		}
		
		protected function onSecurityError(event:Event):void
		{
			// TODO Auto-generated method stub
			_isLoading=false;
		}
		
		protected function onIoerror(event:IOErrorEvent):void
		{
			// TODO Auto-generated method stub
			_isLoading=false;
		}
		
		protected function onComplete(event:Event):void
		{
			_isLoading=false;
			// TODO Auto-generated method stub
			var tmp:Bitmap=loader.contentLoaderInfo.content as Bitmap;
			if (tmp) 
			{
				//imgMeizhi.addChildAt(girlBit,0);
				var text:IStarlingTexture=TextureFactory.fromBitmap(tmp);
				if (!girlBit) 
				{
					girlBit=new Image(text);
				}
				_skin.imgGirl.addChild(girlBit);
			}
		}		
	
		
		protected function onbtnChongzhiClick(event:MouseEvent):void
		{
			GlobalFunction.iWantRecharge;
		}
		
		
		protected override function onShow():void
		{
			super.onShow();
			
			
		}
		private function loadGirl():void
		{
			var gurl:String = Mgr.activityPanelMgr.superVIP_girlImageURL;
			if (gurl!=girlImageUrl&&gurl!=null&&gurl!=""&&!_isLoading) 
			{
				if (girlBit) 
				{
					MCUtil.removeSelf(girlBit);
					girlBit.dispose();
				}
				
				var lc:LoaderContext = new LoaderContext(true);
				loader.unload();
				loader.load(new URLRequest(gurl),lc);
				_isLoading=true;
			}
		}
		private var _isLoading:Boolean;
		/**
		 * http://image.njws.moloong.com/37wan/1482308885241.png 
		 * 
		 */		
		private function RefreshQQInfo(show:Boolean):void
		{
			_skin.grpQQ.visible=show;
			_skin.grpImg.visible=!show;
			//todo 等后端传
			girlQQ = Mgr.activityPanelMgr.superVIP_girlQQ;
			_skin.numQQ.label=girlQQ;
				
				
//			imgMeizhi.setImageUrl();
//			imglab_QQ.visible=(girlQQ!=null&&girlQQ!="");
//			imglab_QQ.text=girlQQ;
//			
//		
//			btnCopy.visible = imglab_QQ.visible ;
			
		
		}
	
	}
}