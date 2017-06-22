package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.JiXianTiaoZhanCfgData;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.JiXianAcInfo;
	import com.rpgGame.coreData.clientConfig.Q_limitchallenge;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.Scroller;
	import feathers.controls.UIAsset;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.activety.jixiantiaozhan.JiXianTiaoZhanPaiHang;
	
	import starling.display.DisplayObjectContainer;
	
	public class JiXianTiaozhanPaiHnagPenelExt extends SkinUI
	{
		private static var _ins:JiXianTiaozhanPaiHnagPenelExt;
		
		private var _skin:JiXianTiaoZhanPaiHang;
		private var _q_mod:Q_limitchallenge;
		private var _reward:Array;
		
		private var _icoList:Vector.<UIAsset>;
		private var _icoface:Vector.<IconCDFace>;
		public function JiXianTiaozhanPaiHnagPenelExt()
		{
			_skin=new JiXianTiaoZhanPaiHang();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_icoList=new Vector.<UIAsset>();
			_icoface=new Vector.<IconCDFace>();
			_icoList.push(_skin.icon1);
			_icoList.push(_skin.icon2);
			_icoList.push(_skin.icon3);
			_icoList.push(_skin.icon4);
			for(var i:int=0;i<_icoList.length;i++)
			{
				var ico:IconCDFace=new IconCDFace(IcoSizeEnum.ICON_48);
				ico.selectImgVisible=false;	
				_skin.grpIcon.addChild(ico);
				ico.x=_icoList[i].x-4;
				ico.y=_icoList[i].y-4;
				_icoface.push(ico);
			}
			
			_skin.listItem.itemRendererType=TiaoZhanPaiHangItemRemder;	
			_skin.listItem.clipContent = true;
			_skin.listItem.scrollBarDisplayMode = "fixed";
			_skin.listItem.verticalScrollBarPosition = "right";
			_skin.listItem.scrollBarDisplayMode=ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_skin.listItem.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.listItem.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			_skin.listItem.padding=4;
			_q_mod = JiXianTiaoZhanCfgData.getModById(ActivetyDataManager.jixianVo.activityid);
			_reward = JSONUtil.decode(_q_mod.q_rank_rewards);
			var rank:int=0;
			var list:Vector.<JiXianAcInfo>=new Vector.<JiXianAcInfo>();
			for(i=0;i<_reward.length;i++)
			{
				var info:JiXianAcInfo=new JiXianAcInfo(rank,_reward[i].paras.rank,_reward[i]);
				list.push(info);
				rank=_reward[i].paras.rank;
			}
			_skin.listItem.dataProvider=new ListCollection(list);
			if(ActivetyDataManager.jixianVo.rank==-1){
				_skin.grpIcon.visible=false;
				_skin.uiWRB.visible=true;
			}
			else{
				var reward:Array=getRankReward(ActivetyDataManager.jixianVo.rank);
				if(reward.length==0||reward==null)
				{
					reward=JSONUtil.decode(_q_mod.q_join_rewards);
				}
				setRewardShow(reward);
			}
		}
		
		private function setRewardShow(rewards:Array):void
		{
			for(var i:int=0;i<_icoList.length;i++)
			{
				if(i<rewards.length)
				{
					var itemInfo:ClientItemInfo=new ClientItemInfo(rewards[i].mod);
					FaceUtil.SetItemGrid(_icoface[i],itemInfo);
					_icoface[i].visible=true;
					_icoList[i].visible=true;
				}
				else
				{
					_icoface[i].clear();
					_icoface[i].visible=true;
					_icoList[i].visible=true;
				}
			}
		}
		
		/**
		 *获取排行奖励 
		 * @return 
		 * 
		 */
		public function getRankReward(rank:int):Array
		{
			var result:Array=[];
			var num:int=_reward.length;
			var rankSeat:int=getRewardRank(rank);
			if(rankSeat==-1){
				num=0;
			}
			for(var i:int=0;i<num;i++){
				if(_reward[i].paras.rank==rank){
					result.push(_reward[i]);
				}
			}
			return result;
		}
		
		/**
		 *获取所在的排行段 
		 * @param rank
		 * @return 
		 * 
		 */
		private function getRewardRank(rank:int):int
		{
			var num:int=_reward.length-1;
			var result:int=-1;
			for(var i:int=num;i>=0;i--){
				if(_reward[i].paras.rank<rank){
					break;
				}
				result=_reward[i].paras.rank;
			}
			return result;
		}
		
		public static function showPanel(container:DisplayObjectContainer):int
		{
			if(!_ins) _ins=new JiXianTiaozhanPaiHnagPenelExt();
			_ins.x=container.width-5;
			_ins.y=(container.height-_ins.height)/2+5;
			container.addChild(_ins);
			return _ins.width;
		}
		
		public static function remove(con:DisplayObjectContainer):void
		{
			if (_ins&&_ins.parent==con) 
			{
				MCUtil.removeSelf(_ins);
			}
		}
		
		/**切换面板时调用*/
		public static function hidePanel():void
		{
			if (_ins&&_ins.parent) 
			{
				_ins.parent.x+=_ins.width/2;
				MCUtil.removeSelf(_ins);
			}		
		}
		
		public static function get ins():JiXianTiaozhanPaiHnagPenelExt
		{
			return _ins;
		}
	}
}