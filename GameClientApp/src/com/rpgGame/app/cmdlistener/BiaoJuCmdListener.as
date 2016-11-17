package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.BiaoJuManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.process.StartGame;
	import com.rpgGame.app.sender.BiaoJuSender;
	
	import flash.utils.ByteArray;
	
	import app.cmd.BiaoModuleMessages;
	import app.message.AllBiaoJuLogProto;
	import app.message.BiaoJuProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	public class BiaoJuCmdListener extends BaseBean
	{
		public function BiaoJuCmdListener()
		{
			super();
		}
		
		override public function start():void
		{
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_GET_BIAO_JU_DATA,getBiaoJuData);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_GET_BIAO_JU_DATA_FAIL,getBiaoJuDataFail);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_RECHARGE_BIAO_JU_MONEY,rechargeBiaoJuMoney);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_RECHARGE_BIAO_JU_MONEY_FAIL,rechargeBiaoJuMoneyFail);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_OPEN_BIAO_JU_FAIL,openBiaoJuFail);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_OPEN_BIAO_JU_BROADCAST,openBiaoJuBroadcast);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_BIAO_JU_RESET_DAILY,biaoJuResetDaily);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_BIAO_JU_LOG,biaoJuLog);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_BIAO_JU_LOG_FAIL,biaoJuLogFail);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_BIAO_JU_OPEN_INFO,onBiaoJuOpenInfo);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_TOU_BAO,onTouBao);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_TOU_BAO_FAIL,onTouBaoFail);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_BIAO_TOU_BAO,onBiaoTouBao);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_ALLOCATE_SALARY,allocateSalary);
			SocketConnection_protoBuffer.addCmdListener(BiaoModuleMessages.S2C_ALLOCATE_SALARY_FAIL,allocateSalaryFail);
			finish();
		}
		/**
		 * 请求镖局日志失败,返回varint32错误码
		 * <p>
		 * 1.没有家族
		 * 2.没有帮派
		 * 3.不是王帮
		 */
		private function biaoJuLogFail(bytes:ByteBuffer):void
		{
			var error : int = bytes.readVarint32();
			NoticeManager.showNotify("biaoJuLogFail"+error);
		}
		/**
		 * 分配失败,返回varint32错误码
		 * <p>
		 * 1.今日已经分配了
		 * 2.当前无法分配
		 * 3.不是国王
		 * 4.有人不是官员
		 * 5.利润不够,无法分配
		 * <p>
		 * 100.有人被分配了两次
		 */
		private function allocateSalaryFail(bytes:ByteBuffer):void
		{
			var error : int = bytes.readVarint32();
			NoticeManager.showNotify("allocateSalaryFail"+error);
		}
		
		private function allocateSalary(bytes:ByteBuffer):void
		{
			NoticeManager.showNotify("分配成功");
			BiaoJuSender.getBiaoJuData();
		}
		
		private function onBiaoTouBao(bytes:ByteBuffer):void
		{
			var id : Number = bytes.readVarint64();
			BiaoJuManager.onScenetHaveTouBao(id);
		}
		/**
		 * 投保失败,返回varint32错误码
		 * <p>
		 * 1. 镖局没有开启,无法投保
		 * 2. 没有镖车,怎么投保
		 * 3. 破损镖车无法投保
		 * 4. 镖车投保了
		 * 5. 钱不够,无法投保
		 * 6. 镖车已经死亡,无法投保
		 * 7. 没有足够的运营资金去投保
		 * 8. 镖车距离npc过远
		 * 9. 该镖车当前无法投保
		 * <p>
		 * 100. 服务器bug
		 */
		private function onTouBaoFail(bytes:ByteBuffer):void
		{
			var error : int = bytes.readVarint32();
			NoticeManager.showNotify("onTouBaoFail"+error);
		}
		
		private function onTouBao(bytes:ByteBuffer):void
		{
			NoticeManager.showNotify("投保成功");
		}
		/**
		 * 返回本国镖局的开启状态
		 * <p>
		 * varint64 开始时间 时间为0，表示未开启
		 * varint64 结束时间 时间为0，表示未开启
		 *
		 */
		private function onBiaoJuOpenInfo(bytes:ByteBuffer):void
		{
			var startTime : Number = bytes.readVarint64();
			var endTime : Number = bytes.readVarint64();
			BiaoJuManager.setBiaoJuOpenInfo(startTime,endTime);
		}
		/**
		 * 返回镖局日志
		 *
		 * 先解压缩压缩
		 *
		 * bytes AllBiaoJuLogProto
		 */
		private function biaoJuLog(bytes:ByteBuffer):void
		{
			var data : AllBiaoJuLogProto = new AllBiaoJuLogProto();
			var byte : ByteArray = new ByteArray();
			bytes.readBytes(byte);
			byte.uncompress();
			data.mergeFrom(byte);
			BiaoJuManager.setbiaoJuLog(data);
		}
		/**
		 * 镖局每日重置
		 */
		private function biaoJuResetDaily(bytes:ByteBuffer):void
		{
			BiaoJuManager.biaoJuResetDaily();
		}
		/**
		 * 开启镖局广播
		 * <p>
		 * varint32 国家
		 * boolean true(开启)/false(关闭)
		 * <p>
		 * if(buffer.readable()){
		 * 开启了
		 * varint64 自动结束时间
		 * } else {
		 * 关闭了
		 * }
		 */
		private function openBiaoJuBroadcast(bytes:ByteBuffer):void
		{
			var country : int = bytes.readVarint32();
			var isOpen : Boolean = false;
			if(bytes.bytesAvailable)
			{
				isOpen = true;
				var end:Number = bytes.readVarint64();
				BiaoJuManager.setBiaoJuOpenInfo(SystemTimeManager.curtTm,end);
			}
			BiaoJuManager.openBiaoJuBroadcast(country,isOpen);
		}
		/**
		 * 开启镖局失败,返回varint32错误码
		 * <p>
		 * 1.不是国王
		 * 2.镖局已经开启了
		 * 3.当前不在开启时间段
		 * 4.镖局钱不够
		 * 5.当前无法关闭
		 */
		private function openBiaoJuFail(bytes:ByteBuffer):void
		{
			var error : int = bytes.readVarint32();
			NoticeManager.showNotify("openBiaoJuFail"+error);
		}
		/**
		 * 充入镖局资金失败,返回varint32错误码
		 * <p>
		 * 1.没有家族
		 * 2.没有帮派
		 * 3.不是国王
		 * 4.捐的钱数量非法
		 * 5.没有足够的钱充入
		 * <p>
		 * 100.捐的太多了,溢出了
		 */
		private function rechargeBiaoJuMoneyFail(bytes:ByteBuffer):void
		{
			var error : int = bytes.readVarint32();
			NoticeManager.showNotify("rechargeBiaoJuMoneyFail"+error);
		}
		/**
		 * 充值镖局资金成功
		 *
		 * varint64 当前总的资金
		 */
		private function rechargeBiaoJuMoney(bytes:ByteBuffer):void
		{
			var money : Number = bytes.readVarint64();
			BiaoJuManager.rechargeMoney(money);
		}
		/**
		 * 返回镖局数据,返回varint32错误码
		 * <p>
		 * 1.没有家族
		 * 2.没有帮派
		 * 3.不是王帮
		 */
		private function getBiaoJuDataFail(bytes:ByteBuffer):void
		{
			var error : int = bytes.readVarint32();
			NoticeManager.showNotify("getBiaoJuDataFail"+error);
		}
		/**
		 * 返回镖局数据,已经压缩
		 *
		 * 解压缩
		 *
		 * bytes BiaoJuProto
		 */
		private function getBiaoJuData(bytes:ByteBuffer):void
		{
			var data : BiaoJuProto = new BiaoJuProto();
			var byte : ByteArray = new ByteArray();
			bytes.readBytes(byte);
			byte.uncompress();
			data.mergeFrom(byte);
			BiaoJuManager.setUp(data);
		}
	}
}