package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.active.JiXianAcInfo;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.TiaoZhanPaiHang_Item;
	
	public class JiXianTiaoZhanPaiHangItem extends SkinUI
	{
		private var _skin:TiaoZhanPaiHang_Item;
		private var _grids:Vector.<IconCDFace>=new Vector.<IconCDFace>();
		
		public function JiXianTiaoZhanPaiHangItem()
		{
			_skin=new TiaoZhanPaiHang_Item();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			var ico:IconCDFace;
			for(var i:int=0;i<4;i++)
			{
				ico=new IconCDFace(IcoSizeEnum.ICON_48);
				ico.selectImgVisible=false;
				var ui:UIAsset=_skin.container.getChildByName("ico"+i) as UIAsset;
				ico.bindBg(ui);
				_grids.push(ico);
				_skin.container.addChild(ico);
			}
		}
		
		public function setdate(info:JiXianAcInfo):void
		{
			var initX:int=_skin.ico1.x;
			var initY:int=_skin.ico1.y;
			if(info.nowRank-info.upRank==1){
				_skin.num.label = info.nowRank.toString();
				_skin.gRank.x = 116;
			}
			else
			{
				_skin.num.label = (info.upRank+1).toString()+"-"+info.nowRank.toString();
				if(info.nowRank<10)
					_skin.gRank.x = 145;
				else if(info.nowRank>=10&&info.nowRank<1000)
					_skin.gRank.x = 165;
				else
					_skin.gRank.x = 196;
			}
			var list:Vector.<ClientItemInfo>=(info.reWard as Vector.<ClientItemInfo>); 
			for(var i:int=0;i<list.length;i++)
			{
				var clientItemInfo:ClientItemInfo=list[i];
				FaceUtil.SetItemGrid(_grids[i], clientItemInfo);
			}
		}
		
		public function clear():void
		{
			if(_grids!=null&&_grids.length>0)
			{
				for(var i:int=0;i<_grids.length;i++)
				{
					_skin.container.removeChild(_grids[i]);
				}
				_grids.length=0;
			}
		}
	}
}