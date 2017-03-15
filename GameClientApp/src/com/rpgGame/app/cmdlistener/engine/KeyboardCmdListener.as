package com.rpgGame.app.cmdlistener.engine
{
	import com.game.engine3D.manager.Stage3DLayerManager;
	import com.game.engine3D.utils.PathFinderUtil;
	import com.game.mainCore.core.events.KeyCodeEvent;
	import com.game.mainCore.core.info.key.KeysCodeInfo;
	import com.game.mainCore.core.timer.GameTimer;
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.controller.keyboard.KeyFuncProcess;
	import com.rpgGame.app.controller.keyboard.KeyNormalProcess;
	import com.rpgGame.app.controller.keyboard.KeySpellProcess;
	import com.rpgGame.app.manager.input.KeyMoveManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.core.manager.input.KeyManager;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.info.key.KeyCodeType;
	import com.rpgGame.coreData.info.key.KeyInfo;
	import com.rpgGame.coreData.info.key.MulitKeyInfo;
	
	import flash.events.Event;
	import flash.geom.Vector3D;
	import flash.ui.Keyboard;
	
	import feathers.controls.TextInput;
	import feathers.core.FocusManager;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 键盘侦听器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-27 下午4:25:15
	 *
	 */
	public class KeyboardCmdListener extends BaseBean
	{
		private static var _downKeyList : Vector.<uint> = new Vector.<uint>;
		private static var _upKeyList : Vector.<uint> = new Vector.<uint>;
		private static var _upKeyInfoList : Vector.<KeysCodeInfo> = new Vector.<KeysCodeInfo>;
		private static var _orderKeyList : Vector.<uint> = new Vector.<uint>;

		private static const ORDER_INV : int = 300; //顺序键时间间隔
		private static const ORDER_LENGTH : int = 6; //顺序键长度
		private static const CH_CODE : uint = 229; //过滤掉中文输入法
		private static var _singleInfo : KeyInfo;
		private static var _mixInfo : MulitKeyInfo;
		private static var _orderInfo : MulitKeyInfo;
        
        private var _longPressKey : Vector.<KeyInfo> = new Vector.<KeyInfo>();
        
        private var _timer : GameTimer;

		public function KeyboardCmdListener()
		{
			super();
		}

		override public function start() : void
		{
			EventManager.addEvent(KeyCodeEvent.KEYS_DOWN, onKeysDown);
			EventManager.addEvent(KeyCodeEvent.KEYS_UP, onKeysUp);
			EventManager.addEvent(KeyCodeEvent.KEYS_CLEAR, onKeysClear);
			Stage3DLayerManager.stage.addEventListener(Event.DEACTIVATE, onDeactivate);
            
            this._timer = new GameTimer("KeyboardCmdListener", 500, 0, onTimer);
            this._timer.start();

			super.finish();
		}

		private function onKeysDown(info : KeysCodeInfo) : void
		{
			//当前焦点为可输入文本时不响应快捷键
			if (FocusManager.focus is TextInput)
			{
				return;
			}
/////////////////////////////////////////////////////
			if (info.code == Keyboard.H)
			{
				if (!ClientConfig.isRelease)
				{
				}
				return;
			}

			var index : int = _downKeyList.indexOf(info.code);
			if (index == -1)
			{
				_downKeyList.push(info.code);
			}
			else
			{
				if (info.code != Keyboard.SPACE) //空格键特殊处理下...
				{
					return;
				}
			}
			//记录连续按键信息(连续按键需要down,然后up,记录为一个...)
			if (_upKeyList.length)
			{
				var lastUpKey : KeysCodeInfo = _upKeyList[_upKeyList.length - 1]; //最后一个up的按键
				//如果当前按下的键,已经比上次的up时间间隔超过了400,那么认为已经不在做连续按键的处理 了
				if (info.time - lastUpKey.time > ORDER_INV)
				{
					_orderKeyList.length = 0;
				}
				else
				{
					if (_orderKeyList.length > ORDER_LENGTH)
					{
						_orderKeyList.shift();
					}
					_orderKeyList.push(info.code);
				}
			}
			//执行动作(执行已经在down状态的按键逻辑,也执行顺序键按键逻辑)
			excuteDownKey();
            this.addLongPressKey(KeyManager.getSingleInfo(info.code));
		}

		private function onKeysUp(info : KeysCodeInfo) : void
		{
			//从按下键列表里移除
			var len : int = _downKeyList.length;
			while (len-- > 0)
			{
				if (info.code == _downKeyList[len])
				{
					_downKeyList.splice(len, 1);
				}
			}

			var index : int = _upKeyList.indexOf(info.code);
			if (index == -1)
			{
				_upKeyList.push(info.code);
			}
			if (_upKeyInfoList.length > ORDER_LENGTH)
			{
				_upKeyInfoList.shift();
			}
			_upKeyInfoList.push(info);
			excuteUpKey();

			//从弹起键列表里移除
			len = _upKeyList.length;
			while (len-- > 0)
			{
				if (info.code == _upKeyList[len])
				{
					_upKeyList.splice(len, 1);
				}
			}
            this.delLongPressKey(KeyManager.getSingleInfo(info.code));
		}

		private function onKeysClear() : void
		{
			KeyMoveManager.getInstance().clear();
			_downKeyList.length = 0;
			_upKeyList.length = 0;
			_upKeyInfoList.length = 0;
			_orderKeyList.length = 0;
            this._longPressKey.length = 0;
		}

		private function onDeactivate(e : Event) : void
		{
			onKeysClear();
		}

		private function excuteDownKey() : void
		{
			//处理 KeyOutType.SINGLE
			if (_downKeyList.length == 1)
			{
				if (_orderKeyList.length) //先处理连续按键逻辑,再处理单键按键
				{
					_orderInfo = KeyManager.getOrderInfo(_orderKeyList);
					if (_orderInfo)
					{
						multiKeyExec(_orderInfo);
						//执行顺序按键逻辑
						return;
					}
					else
					{
						//没有顺序按键,继续执行单键按键
						_singleInfo = KeyManager.getSingleInfo(_downKeyList[0]);
						if (_singleInfo)
						{
							if (_singleInfo.funcID > 0)
							{
								singleKeyDownExec(_singleInfo);
								return;
							}
						}
					}
				}
				else
				{
					_singleInfo = KeyManager.getSingleInfo(_downKeyList[0]);
					if (_singleInfo)
					{
						if (_singleInfo.funcID > 0)
						{
							singleKeyDownExec(_singleInfo);
							return;
						}
					}
				}
			}

			//处理 KeyOutType.MIX
			if (_downKeyList.length > 1)
			{
				_mixInfo = KeyManager.getMixInfo(_downKeyList);
				if (_mixInfo)
				{
					multiKeyExec(_mixInfo);
					return;
				}
				else
				{
					_singleInfo = KeyManager.getSingleInfo(_downKeyList[_downKeyList.length - 1]);
					if (_singleInfo)
					{
						if (_singleInfo.funcID > 0)
						{
							singleKeyDownExec(_singleInfo);
							return;
						}
					}
				}
			}
		}

		private function excuteUpKey() : void
		{
			var keyList : Vector.<uint> = _upKeyList;
			//处理 KeyOutType.SINGLE
			if (keyList.length > 0)
			{
				_singleInfo = KeyManager.getSingleInfo(keyList[0]);
				if (_singleInfo)
				{
					if (_singleInfo.funcID > 0)
					{
						singleKeyUpExec(_singleInfo);
						return;
					}
				}
					//				else if(keyList[0] == Keyboard.ENTER)//回车
					//				{
					//					KeyEnterFunManager.excuteEnter();
					//					return;
					//				}
			}

			//处理 KeyOutType.MIX
			//			if(keyList.length > 1)
			//			{
			//				_mixInfo = KeyManager.getMixInfo(keyList);
			//				if(_mixInfo)
			//				{
			//					if(_mixInfo.dataID > 0)
			//					{
			//						multiKeyExec(_mixInfo);
			//						return;
			//					}
			//				}
			//				else
			//				{
			//					//混合按键找不到,处理顺序按键
			//					_mixInfo = KeyManager.getOrderInfo(keyList);
			//					if(_mixInfo)
			//					{
			//						if(_mixInfo.dataID > 0)
			//						{
			//							multiKeyExec(_mixInfo);
			//							return;
			//						}
			//					}
			//					else//最后处理多按键最后一个,作为单一按键处理(不要处理了,会很2)
			//					{
			////						_singleInfo = KeyManager.getSingleInfo(keyList[keyList.length-1]);
			////						if(_singleInfo)
			////						{
			////							if(_singleInfo.funcID > 0)
			////							{
			////								singleKeyDownExec(_singleInfo);
			////								return;
			////							}
			////						}
			//					}
			//				}
			//			}
		}

		//------------------------------------------------
		// single Exec
		//------------------------------------------------

		private function singleKeyDownExec(info : KeyInfo) : void
		{
			//GameLog.addShow("singleKeyDownExec--:"+info.name+"_"+info.type+"_"+info.code);
			////////////////////////////////////////// 
			switch (info.type)
			{
				case KeyCodeType.NORMAL:
					info.funcS = info.funcID.toString();
					KeyNormalProcess.exec(info);
					break;
				case KeyCodeType.FUNC:
					info.funcS = info.funcID.toString();
					KeyFuncProcess.exec(info);
					break;
				case KeyCodeType.SKILL:
					info.funcS = info.funcID.toString();
					KeySpellProcess.exec(info);
					break;
				case KeyCodeType.MOVE:
					info.funcS = info.funcID.toString();
					KeyMoveManager.getInstance().setKeyStatus(info);
					break;
			}
		}

		private function singleKeyUpExec(info : KeyInfo) : void
		{
			switch (info.type)
			{
				case KeyCodeType.MOVE:
					info.funcS = info.funcID.toString();
					//执行动作(只执行已经在down状态的按键逻辑)
					///////////////////////////////////////////
					KeyMoveManager.getInstance().setKeyStatus(info, false);
					break;
                case KeyCodeType.SKILL:
                    info.funcS = info.funcID.toString();
                    KeySpellProcess.execUp(info);
                    break;
			}
		}

		//------------------------------------------------
		// multi Exec
		//------------------------------------------------
		private function multiKeyExec(info : MulitKeyInfo) : void
		{
			//			GameLog.add("multiKeyDownExec--执行组合键:"+info.codes);
			var keyInfo : KeyInfo = new KeyInfo();
			keyInfo.dataID = info.dataID;
			keyInfo.funcS = info.funcID;
			keyInfo.name = info.name;
			switch (info.type)
			{
				case KeyCodeType.NORMAL:
					KeyNormalProcess.exec(keyInfo);
					break;
				case KeyCodeType.FUNC:
					KeyFuncProcess.exec(keyInfo);
					break;
				case KeyCodeType.MOVE:
					KeyMoveManager.getInstance().setKeyStatus(keyInfo);
					break;
			}
		}
        
        private function addLongPressKey(info : KeyInfo) : void {
            if (null == info || KeyCodeType.SKILL != info.type) {
                return;
            }
            this._longPressKey.push(info);
        }
        
        private function delLongPressKey(info : KeyInfo) : void {
            if (null == info || KeyCodeType.SKILL != info.type) {
                return;
            }
            for (var i : int = 0; i < this._longPressKey.length;) {
                if (info.code == this._longPressKey[i].code) {
                    this._longPressKey.splice(i, 1);
                } else {
                    ++i
                }
            }
        }
        
        private function onTimer() : void {
            if (this._longPressKey.length < 1) {
                return;
            }
            this.singleKeyDownExec(this._longPressKey[this._longPressKey.length - 1]);
        }
	}
}
