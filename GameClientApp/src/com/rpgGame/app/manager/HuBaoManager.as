package com.rpgGame.app.manager
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.HuBaoSender;
	import com.rpgGame.app.utils.TaskUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.HuBaoEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.core.utils.NumberUtil;
	import com.rpgGame.coreData.cfg.HuBaoData;
	import com.rpgGame.coreData.clientConfig.Q_convoy;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.AIStateType;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.convoy.message.SCConvoyFailureMessage;
	import com.rpgGame.netData.convoy.message.SCConvoyInfoMessage;
	import com.rpgGame.netData.convoy.message.SCConvoyNumMessage;
	import com.rpgGame.netData.convoy.message.SCConvoyToClientMessage;
	import com.rpgGame.netData.convoy.message.SCRefreshGirlMessage;
	import com.rpgGame.netData.convoy.message.SCSuccessInfoMessage;
	
	import org.client.mainCore.manager.EventManager;
	
	public class HuBaoManager
	{	
		public var iszidong:Boolean;
		public var istishi:Boolean;
		
		private var _num:int=0;	
		private var _prize:Vector.<ItemInfo>;
		private var _time:int=0;
		
		private var _gTimer : GameTimer;
		public static var AUTHUBAO:int=10;
		
		public function HuBaoManager()
		{
			_gTimer = new GameTimer("HuBaoManager", 1000, 0, onUpdate);
			super();
			EventManager.addEvent(UserMoveEvent.MOVE_RESCHANGE, onHuBaoHandler);
		}
		
		private static var _instance:HuBaoManager;
		public static function instance():HuBaoManager
		{
			if(_instance==null)
			{
				_instance = new HuBaoManager();
				_instance._gTimer.reset();
				_instance._gTimer.start();
			}
			return _instance;
		}
		
		public function get num():int
		{
			return instance()._num;
		}
		
		private var _lv:int=0;
		public function get level():int
		{
			return instance()._lv;
		}
		
		private var _isdouble:int=0;
		public function get isdouble():int
		{
			return instance()._isdouble;
		}
		
		private var _ishuing:Boolean;
		public function get ishuing():Boolean
		{
			return instance()._ishuing;
		}
		
		public function get prize():Vector.<ItemInfo>
		{
			return instance()._prize;
		}
		
		public function get time():int
		{
			return instance()._time;
		}
		
		private var _techSta:int=0;
		private function onUpdate(force : Boolean = false) : void
		{
			if(_ishuing)
			{
				if(MainRoleManager.actor.stateMachine.isIdle)
				{
					_techSta++;
					if(_techSta>=AUTHUBAO)
					{
						_techSta=0;
						onwalkToNpc(HuBaoData.destinationNpc);
					}
				}
				else
				{
					_techSta=0;
				}
			}
		}
		
		public function gettipsText(q_con:Q_convoy):String
		{
			var str:String="";
			str=q_con.q_girl_level+"\n"+"奖励："+"\n";
			var obj:Array=getJIangLiByLv(q_con);
			for(var i:int=0;i<obj.length;i++)
			{
				var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(obj[i].mod,1);
				var num:String=NumberUtil.getNumberTo(obj[i].num);
				str+=itemInfo.qItem.q_name+": ×"+num+"\n";
			}		
			return str;
		}
		
		/**
		 * 护宝追踪面板信息
		 * */
		public function onSCConvoyInfoMessage(msg:SCConvoyInfoMessage):void
		{
			instance()._ishuing=true;
			instance()._num=msg.remainNum;
			instance()._lv=msg.girlId;
			instance()._prize=msg.reward;
			instance()._time=msg.remainTime;
			var role:SceneRole=MainRoleManager.actor;
			(role.data as HeroData).baowuLv=msg.girlId;
			if (role.headFace is HeadFace)
				(role.headFace as HeadFace).updateHuBaoTitle((role.data as HeroData).baowuLv);
			AppManager.showApp(AppConstant.HUBAO_ZHUIZONG);	
			EventManager.dispatchEvent(HuBaoEvent.HUBAO_ZHUIZONG,msg);
		}
		
		/**
		 * 护宝面板信息
		 * */
		public function onSCConvoyNumMessage(msg:SCConvoyNumMessage):void
		{
			instance()._num=msg.remainNum;
			instance()._lv=msg.girlId;
			instance().istishi=msg.isnotice==1;
			instance()._isdouble=msg.isdouble;
			AppManager.showAppNoHide(AppConstant.HUBAO_MAINPANEL);
		}
		
		/**
		 * 护宝结算信息
		 * */
		public function onSCSuccessInfoMessage(msg:SCSuccessInfoMessage):void
		{
			instance()._ishuing=false;
			var role:SceneRole=MainRoleManager.actor;
			(role.data as HeroData).baowuLv=0;
			if (role.headFace is HeadFace)
				(role.headFace as HeadFace).updateHuBaoTitle((role.data as HeroData).baowuLv);
			AppManager.showAppNoHide(AppConstant.HUBAO_CHENGGONG);
			EventManager.dispatchEvent(HuBaoEvent.HUBAO_HUSONGCHENGGONG,msg);
		}
		
		/**
		 * 更新品质信息
		 * */
		public function onSCRefreshGirlMessage(msg:SCRefreshGirlMessage):void
		{
			instance()._lv=msg.girlId;
			EventManager.dispatchEvent(HuBaoEvent.HUBAO_UPDATEPINZHI,msg.girlId);
		}
		
		public function onSCConvoyFailureMessage(msg:SCConvoyFailureMessage):void
		{
			instance()._ishuing=false;
			var role:SceneRole=MainRoleManager.actor;
			(role.data as HeroData).baowuLv=0;
			if (role.headFace is HeadFace)
				(role.headFace as HeadFace).updateHuBaoTitle((role.data as HeroData).baowuLv);
			EventManager.dispatchEvent(HuBaoEvent.HUBAO_HUSONGSHIBAI,msg);
		}
		
		public function onSCConvoyToClientMessage(msg:SCConvoyToClientMessage):void
		{
			var role:SceneRole=SceneManager.getSceneObjByID(msg.playerId.ToGID())as SceneRole;
			if(role)
			{
				(role.data as HeroData).baowuLv=msg.convoyId;
				if (role.headFace is HeadFace)
					(role.headFace as HeadFace).updateHuBaoTitle((role.data as HeroData).baowuLv);
			}
		}
		
		private var _npcConfigId:int=0;
		/**寻路npc*/
		public function onwalkToNpc(npcconfigId:int):void
		{
			_npcConfigId=npcconfigId;
			TaskUtil.npcTaskWalk(_npcConfigId,toDo);
		}
		
		private function toDo(data :Object):void
		{
			HuBaoSender.upCSClientDataMessage(_npcConfigId);
		}
		
		public function onHuBaoHandler():void
		{
			var dist:int = TaskUtil.getDistHuBaoNpc();
			if(dist>=0&&dist<100)
			{
				HuBaoSender.upCSClientDataMessage(HuBaoData.acceptNpc);
			}
		}
		
		public function getJIangLiByLv(q_con:Q_convoy):Array
		{
			if(q_con){
				var arr:Array,guize:Array;
				arr=JSONUtil.decode(q_con.q_reward);
				guize=JSONUtil.decode(q_con.q_level_rank);
				if(arr==null||arr.length==0) return null;
				var starLv:int=guize[0];
				var maxLv:int=guize[1];
				var view:int=guize[2];
				
				var playerLv:int=MainRoleManager.actorInfo.totalStat.level;
				var num:int=(int(playerLv/10))*10;
				if(num<starLv) return arr[0];
				else if(num>=maxLv) return arr[arr.length-1];
				else{
					return arr[(num-starLv)/10];
				}
			}
			return null;
		}
	}
}