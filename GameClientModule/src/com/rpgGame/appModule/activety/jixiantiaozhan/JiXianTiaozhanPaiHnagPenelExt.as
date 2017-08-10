package com.rpgGame.appModule.activety.jixiantiaozhan
{
	import com.gameClient.utils.HashMap;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.active.JiXianAcInfo;
	import com.rpgGame.coreData.clientConfig.Q_limitchallenge;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	
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
		private var _reward:HashMap;
		
		private var _icoList:Vector.<UIAsset>;
		private var _icoface:Vector.<IconCDFace>;
		public function JiXianTiaozhanPaiHnagPenelExt()
		{
			_skin=new JiXianTiaoZhanPaiHang();
			super(_skin);
			MCUtil.removeSelf(_skin.btnClose);
			_skin.listItem.itemRendererFactory = creatremder;	
			_skin.listItem.clipContent = true;
			//			_skin.listItem.scrollBarDisplayMode = "fixed";
			_skin.listItem.verticalScrollBarPosition = "right";
			_skin.listItem.scrollBarDisplayMode=ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_skin.listItem.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			_skin.listItem.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			_skin.listItem.padding=0;
			
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
				ico.x=_icoList[i].x;
				ico.y=_icoList[i].y;
				_icoface.push(ico);
			}
			
			_q_mod = ActivetyDataManager.jixianVo.qmod;
			_reward = assemblyPrizae(_q_mod.q_rank_rewards);
			var keys:Array=_reward.keys();
			keys.sort(short);
			var rank:int=0;
			var list:Array=[];
			for(i=0;i<keys.length;i++)
			{
				var info:JiXianAcInfo=new JiXianAcInfo(rank,keys[i],_reward.getValue(keys[i]));
				list.push(info);
				rank=keys[i];
			}
			_skin.listItem.dataProvider=new ListCollection(list);
			if(ActivetyDataManager.jixianVo.rank<1){
				_skin.lbPaiming.text="暂无";
				_skin.uiJiangli.visible=false;
				_skin.grpIcon.visible=false;
				_skin.uiWRB.visible=true;
			}
			else{
				var reward:Vector.<ClientItemInfo>=getRankReward(ActivetyDataManager.jixianVo.rank);
				setRewardShow(reward);
				_skin.lbPaiming.text=ActivetyDataManager.jixianVo.rank.toString();
				_skin.uiJiangli.visible=true;
				_skin.grpIcon.visible=true;
				_skin.uiWRB.visible=false;
			}
		}
		
		private function short(i1:int,i2:int):int
		{
			if(i1<i2) return -1;
			else if(i1>i2) return 1;
			return 0;
		}
		
		/**组装奖励*/
		private function assemblyPrizae(str:String):HashMap
		{
			var arr:Array = JSONUtil.decode(str);
			if(arr)
			{
				var has:HashMap=new HashMap();
				var vec:Vector.<ClientItemInfo>;
				for(var i:int=0;i<arr.length;i++)
				{
					var rank:int=arr[i].paras.rank;
					var mod:int=arr[i].mod;
					var num:int=arr[i].num;
					var item:ClientItemInfo=ItemUtil.convertClientItemInfoById(mod,num);
					if(has.getValue(rank)){
						vec=has.getValue(rank);
						vec.push(item);						
					}
					else{
						vec=new Vector.<ClientItemInfo>();
						vec.push(item);
						has.put(rank,vec);
					}
				}
				return has;
			}
			return null;
		}
		
		private function creatremder():TiaoZhanPaiHangItemRemder
		{
			return new TiaoZhanPaiHangItemRemder();
		}
		
		private function setRewardShow(rewards:Vector.<ClientItemInfo>):void
		{
			for(var i:int=0;i<_icoList.length;i++)
			{
				if(i<rewards.length)
				{
					var itemInfo:ClientItemInfo=rewards[i];//ItemUtil.convertClientItemInfoById(rewards[i].mod,1);
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
		public function getRankReward(rank:int):Vector.<ClientItemInfo>
		{
			var result:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			var keys:Array=_reward.keys();
			keys.sort(short);
			var num:int=keys.length;
			var rankSeat:int=getRewardRank(rank);
			if(rankSeat==-1){
				num=0;
			}
			for(var i:int=0;i<num;i++){
				if(keys[i]==rank){
					result=_reward.getValue(rank);
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
			var keys:Array=_reward.keys();
			keys.sort(short);
			var num:int=keys.length;
			var result:int=-1;
			
			for(var i:int=num;i>=0;i--){
				if(keys[i]<rank){
					break;
				}
				result=keys[i];
			}
			return result;
		}
		
		public static function showPanel(container:DisplayObjectContainer):int
		{
			if(!_ins) _ins=new JiXianTiaozhanPaiHnagPenelExt();
			_ins.x=container.width-10;
			_ins.y=(container.height-_ins.height)/2+22;
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