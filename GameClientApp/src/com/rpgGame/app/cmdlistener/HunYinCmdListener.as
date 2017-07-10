package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.core.events.HunYinEvent;
	import com.rpgGame.netData.marriage.message.SCDivorceMessage;
	import com.rpgGame.netData.marriage.message.SCInteractionMessage;
	import com.rpgGame.netData.marriage.message.SCMarriageInfoMessage;
	import com.rpgGame.netData.marriage.message.SCMarriageLogMessage;
	import com.rpgGame.netData.marriage.message.SCNoticeZoneMessage;
	import com.rpgGame.netData.marriage.message.SCProposalResultMessage;
	import com.rpgGame.netData.marriage.message.SCRefuseNtoiceMessage;
	import com.rpgGame.netData.marriage.message.SCTargetProposalMessage;
	import com.rpgGame.netData.marriage.message.SCUpGradeMessage;
	import com.rpgGame.netData.marriage.message.SCUpdateZoneSubNumMessage;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	
	/**
	 * 婚姻相关协议
	 * */
	public class HunYinCmdListener extends BaseBean
	{
		override public function start():void
		{
			SocketConnection.addCmdListener(150112, onSCDivorceMessage);
			SocketConnection.addCmdListener(150108,onSCInteractionMessage);
			SocketConnection.addCmdListener(150106,onSCMarriageInfoMessage);
			SocketConnection.addCmdListener(150115,onSCMarriageLogMessage);
			SocketConnection.addCmdListener(150104,onSCProposalResultMessage);
			SocketConnection.addCmdListener(150102,onSCTargetProposalMessage);
			SocketConnection.addCmdListener(150110,onSCUpGradeMessage);
			SocketConnection.addCmdListener(150116,onSCNoticeZoneMessage);
			SocketConnection.addCmdListener(150118,onSCRefuseNtoiceMessage);
			SocketConnection.addCmdListener(150119,onSCUpdateZoneSubNumMessage);
			
			super.finish();
		}
		
		/**
		 * 离婚结果反馈
		 * */
		private function onSCDivorceMessage(msg:SCDivorceMessage):void
		{
			Mgr.hunyinMgr.onSCDivorceMessage(msg);
		}
		
		/**
		 * 夫妻互动结果
		 * */
		private function onSCInteractionMessage(msg:SCInteractionMessage):void
		{
			Mgr.hunyinMgr.onSCInteractionMessage(msg);
		}
		
		/**
		 * 婚姻数据
		 * */
		private function onSCMarriageInfoMessage(msg:SCMarriageInfoMessage):void
		{
			Mgr.hunyinMgr.onSCMarriageInfoMessage(msg);
		}
		
		/**
		 * 夫妻日志
		 * */
		private function onSCMarriageLogMessage(msg:SCMarriageLogMessage):void
		{
			Mgr.hunyinMgr.onSCMarriageLogMessage(msg);
		}
		
		/**
		 * 副本邀请提示
		 * */
		private function onSCNoticeZoneMessage(msg:SCNoticeZoneMessage):void
		{
			Mgr.hunyinMgr.onSCNoticeZoneMessage(msg);
		}
		
		/**
		 * 拒绝提示
		 * */
		private function onSCRefuseNtoiceMessage(msg:SCRefuseNtoiceMessage):void
		{
			Mgr.hunyinMgr.onSCRefuseNtoiceMessage(msg);
		}
		
		/**
		 * 求婚反馈
		 * */
		private function onSCProposalResultMessage(msg:SCProposalResultMessage):void
		{
			Mgr.hunyinMgr.onSCProposalResultMessage(msg);
		}
		
		/**
		 * 被求婚提示
		 * */
		private function onSCTargetProposalMessage(msg:SCTargetProposalMessage):void
		{
			Mgr.hunyinMgr.onSCTargetProposalMessage(msg);
		}
		
		/**
		 * 副本次数刷新
		 * */
		private function onSCUpdateZoneSubNumMessage(msg:SCUpdateZoneSubNumMessage):void
		{
			Mgr.hunyinMgr.onSCUpdateZoneSubNumMessage(msg);
		}
		
		/**
		 * 结婚戒子进阶结果
		 * */
		private function onSCUpGradeMessage(msg:SCUpGradeMessage):void
		{
			Mgr.hunyinMgr.onSCUpGradeMessage(msg);
		}
	}
}