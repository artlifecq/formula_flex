package com.rpgGame.app.ui.tips
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.core.view.ui.tip.vo.MeiRenGuanQiaData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	
	import feathers.controls.UIAsset;
	
	import org.mokylin.skin.app.meiren.MeiRenGuanKa_Tips;
	
	public class MeiRenGuanQiaTip extends SkinUI implements ITip
	{
		private var _skin:MeiRenGuanKa_Tips;
		
		private var _info:MeiRenGuanQiaData;
		private var _prizeList:Vector.<IconCDFace>;
		public function MeiRenGuanQiaTip()
		{
			_skin=new MeiRenGuanKa_Tips();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_prizeList=new Vector.<IconCDFace>();
			for(var i:int=1;i<=4;i++)
			{
				var ico:IconCDFace=new IconCDFace(IcoSizeEnum.ICON_48);
				ico.selectImgVisible=false;
				var uias:UIAsset=_skin.container.getChildByName("icon"+i) as UIAsset;
				ico.bindBg(uias);
				_prizeList.push(ico);
				_skin.container.addChild(ico);
			}
		}
		
		/**
		 * 设置物品数据tips
		 * @param data
		 *
		 */
		public function setTipData(data : *) : void
		{
			_info=data as MeiRenGuanQiaData;
			_skin.lbZhanli.text=_info.zhanli.toString();
			_skin.lb_name.text="【"+_info.guanqiaName+"】";;
			if(_info.tongguanBool){
				_skin.lbZhuangtai.text="已通关";
				_skin.lbZhuangtai.color=StaticValue.GREEN_TEXT;
			}else{
				_skin.lbZhuangtai.text="未通关";
				_skin.lbZhuangtai.color=StaticValue.RED_TEXT;
			}
			var arr:Array=_info.prize;
			if(arr){
				for(var i:int=0;i<_prizeList.length;i++)
				{
					if(i<arr.length)	{
						var info:ClientItemInfo=ItemUtil.convertClientItemInfoById(arr[i].mod,arr[i].num);
						FaceUtil.SetItemGrid(_prizeList[i],info);
						_prizeList[i].visible=true;
					}else{
						_prizeList[i].visible=false;
					}
				}
			}
			
		}
		
		public function hideTips() : void
		{
			
		}
		
		private static var _instance : MeiRenGuanQiaTip = null;
		
		public static function get instance() : MeiRenGuanQiaTip
		{
			if (null == _instance)
			{
				_instance = new MeiRenGuanQiaTip();
			}
			return _instance;
		}
	}
}