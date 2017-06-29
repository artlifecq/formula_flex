package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.rpgGame.coreData.cfg.active.JiXianAcInfo;
	
	import feathers.controls.renderers.BaseDefaultListItemRenderer;
	
	public class TiaoZhanPaiHangItemRemder extends BaseDefaultListItemRenderer
	{
		private var _call:JiXianTiaoZhanPaiHangItem;
		public function TiaoZhanPaiHangItemRemder()
		{
			_call = new JiXianTiaoZhanPaiHangItem();
			super();
			this.addChild(_call);
			this.height=_call.height;
			this.width=_call.width;
		}
		
		override public function dispose():void
		{
			super.dispose();
			clear();
		}
		
		override protected function commitData():void
		{
			if(this._data&&this.owner){
				var info:JiXianAcInfo=this._data as JiXianAcInfo;
				_call.setdate(info);
			}else{
				_call.clear();
			}
		}
		
		private function clear():void
		{
			_call.clear();
		}
	}
}