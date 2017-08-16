package com.rpgGame.appModule.shop
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.LinkUtil;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.SourceGetCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.clientConfig.Q_source;
	
	import feathers.controls.Label;
	
	import org.mokylin.skin.app.beibao.Xinfa.Bianshi_Tips;
	
	import starling.display.DisplayObject;
	
	public class ItemGetNoticeShowPanelExt extends SkinUIPanel
	{
		private var _skin:Bianshi_Tips
		private static var _ins:ItemGetNoticeShowPanelExt;
		private var _labs:Array=[];
		private var _pools:Array=null;
		private var _startY:int;
		private var _textArr:Array;
		private var _accArr:Array;
		public function ItemGetNoticeShowPanelExt()
		{
			_skin=new Bianshi_Tips();
			super(_skin);
			MCUtil.removeSelf(_skin.lbBoss);
			MCUtil.removeSelf(_skin.lbJixian);
			MCUtil.removeSelf(_skin.lbFuben);
			_pools=[_skin.lbBoss,_skin.lbJixian,_skin.lbFuben];
			_startY=_skin.lbFuben.y;
			_skin.uiTitle.styleName="ui/common/background/daojuhuoqu.png";
		}
		
		public static function showItem(item:int):void
		{
			var qSource:Q_source=SourceGetCfg.getSource(item);
			if (!qSource) 
			{
				return;
			}
			if (qSource.q_shoptype!=-1) 
			{
				ItemGetAdvisePanelExt.showBuyItem(item,null);
				return 
			}
			ins.setData(qSource);
			StarlingLayerManager.tipUILayer.addChild(ins);
			
		}
		private function setData(qSource:Q_source):void
		{
			_skin.lbCailiao.htmlText="需要"+ItemConfig.getItemNameWithQualityColor(qSource.q_itemid);
			_skin.labItem.htmlText=ItemConfig.getItemNameWithQualityColor(qSource.q_itemid)+"获得途径：";
			clearlabs();
			_textArr=qSource.q_accessdeclist.split(",");
			_accArr=JSONUtil.decode(qSource.q_accesslist);
			if (_textArr.length!=_accArr.length) 
			{
				return;
			}
			var len:int=_textArr.length;
			var tmp:Label;
			for (var i:int = 0; i < len; i++) 
			{
				tmp=getLab();
				tmp.text=_textArr[i];
				tmp.x=_skin.lbBoss.x;
				tmp.y=_startY+i*25;
				this.addChild(tmp);
			}
			this._skin.height=Math.max(_startY+25*len+45,217);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if (target is Label) 
			{
				var tmp:Label=target as Label;
				if (_textArr&&_accArr) 
				{
					var index:int=_textArr.indexOf(tmp.text);
					if (index!=-1&&index<_accArr.length) 
					{
						LinkUtil.LinkDo(_accArr[index]);
					}
				}
			}
		}
		private function getLab():Label
		{
			if (_pools.length>0) 
			{
				return _pools.pop();
			}
			else
			{
				return MCUtil.clonelab(_skin.lbBoss);
			}
		}
		private function clearlabs():void
		{
			_pools=_pools.concat(_labs);
			for each (var lab:Label in _labs) 
			{
				MCUtil.removeSelf(lab);
			}
			_labs.length=0;
		}

		public static function get ins():ItemGetNoticeShowPanelExt
		{
			if (!_ins) 
			{
				_ins=new ItemGetNoticeShowPanelExt();
			}
			return _ins;
		}

		
	}
}