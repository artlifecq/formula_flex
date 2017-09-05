package com.rpgGame.coreData.cfg
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.coreData.info.key.KeyInfo;
	import com.rpgGame.coreData.info.key.KeyOutType;
	import com.rpgGame.coreData.info.key.MulitKeyInfo;

	import org.client.mainCore.ds.HashMap;

	/**
	 * 键位配置XML表（默认键位）
	 * @author carver
	 *
	 */
	public class KeyCodeXMLInfo
	{
		private static var NODE_NAME : String = "key";
		/** 单键HashMap **/
		private static var _singleHash : HashMap = new HashMap();
		/** 组合键HashMap **/
		private static var _mixHash : HashMap = new HashMap();
		/** 顺序键HashMap **/
		private static var _orderHash : HashMap = new HashMap();

		///////////////////整合优化一下这里， 好乱好乱 @sunny
		private static var _xml : XML = <root>
				<!--code 键位编号,dataID动作ID,type按键类型（0:普通动作,1:功能操作 -->
				<single>
					<!-- 技能快捷键 -->
					<key funcID="1" code="49" name="1" dataID="0" type="3" />
					<key funcID="2" code="50" name="2" dataID="0" type="3" />
					<key funcID="3" code="51" name="3" dataID="0" type="3" />
					<key funcID="4" code="52" name="4" dataID="0" type="3" />
					<key funcID="5" code="81" name="Q" dataID="" type="3" />
					<key funcID="6" code="87" name="W" dataID="" type="3" />
					<key funcID="7" code="69" name="E" dataID="" type="3" />
					<key funcID="8" code="82" name="R" dataID="" type="3" />
					<key funcID="9" code="112" name="F1" dataID="" type="3" />
<!-- 移动快捷键 
					<key funcID="1" code="87" name="W" dataID="0" type="4"/>
					<key funcID="4" code="68" name="D" dataID="0" type="4"/>
-->
					<key funcID="5" code="38" name="UP" dataID="0" type="4" />
					<key funcID="6" code="40" name="DOWN" dataID="0" type="4" />
					<key funcID="7" code="37" name="LEFT" dataID="0" type="4" />
					<key funcID="8" code="39" name="RIGHT" dataID="0" type="4" />
					<key funcID="225" code="32" name="SPACE" dataID="0" type="4" />

					<!-- 功能快捷键 -->
					<key funcID="1" code="71" name="G" dataID="0" type="2" funName="GmView" />
					<key funcID="2" code="90" name="Z" dataID="0" type="2" funName="TrustView" />
					<key funcID="3" code="77" name="M" dataID="0" type="2" funName="WorldMapPanel" />
					<key funcID="4" code="66" name="B" dataID="0" type="2" funName="BackPackPanel" />
                    <key funcID="13" code="68" name="D" dataID="0" type="2" funName="BackPackPanel" />
					<key funcID="5" code="67" name="C" dataID="0" type="2" funName="RolePanel" />
					<key funcID="6" code="86" name="V" dataID="0" type="2" funName="SpellPanel" />
					<key funcID="7" code="76" name="L" dataID="0" type="2" funName="TaskPanel" />
					<key funcID="8" code="70" name="F" dataID="0" type="2" funName="FriendPanel" />
					<key funcID="9" code="80" name="P" dataID="0" type="2" funName="TaskPanel" />
					<key funcID="10" code="79" name="O" dataID="0" type="2" funName="ShopSystemPanel" />
					<key funcID="11" code="74" name="J" dataID="0" type="2" funName="CountryPanel" />
<!--					<key funcID="12" code="81" name="Q" dataID="0" type="2" funName="EquipChangePanel" />-->
					<key funcID="17" code="72" name="H" dataID="" type="2" funName="" />
					<key funcID="18" code="73" name="I" dataID="" type="5" funName="" />
<!--					<key funcID="14" code="69" name="E" dataID="2" type="2"/>-->
<!--					<key funcID="27" code="82" name="R" dataID="3" type="2"/>-->
					<key funcID="20" code="75" name="K" dataID="" type="2" funName="" />
					<key funcID="23" code="78" name="N" dataID="" type="2" funName="" />
					<key funcID="29" code="84" name="T" dataID="" type="2" funName="" />
					<key funcID="30" code="85" name="U" dataID="" type="2" funName="" />
					<key funcID="33" code="88" name="X" dataID="" type="2" funName="" />
					<key funcID="34" code="89" name="Y" dataID="" type="2" funName="" />
					<key funcID="52" code="27" name="ESC" dataID="0" type="2" />
					<key funcID="51" code="9" name="TAB" dataID="" type="2" />
					<key funcID="65" code="65" name="A" dataID="0" type="2"/>
                    <key funcID="67" code="83" name="S" dataID="0" type="2"/>
					<key funcID="66" code="192" name="~" dataID="0" type="2"/>
					<!--数字 快捷键 -->
					<!-- 加号 -->
					<key funcID="59" code="187" name="=" dataID="0" type="2" />
					<!-- 减号 -->
					<key funcID="60" code="189" name="-" dataID="0" type="2" />
					
					<!-- 特殊快捷键 -->
					<key funcID="226" code="17" name="CTRL" dataID="" type="" />
					<key funcID="227" code="16" name="SHIFT" dataID="" type="2" />
					<key funcID="50" code="18" name="ALT" dataID="" type="5" />
					<key funcID="53" code="35" name="END" dataID="" type="1" />
					<key funcID="54" code="36" name="HOME" dataID="" type="1" />
					<key funcID="55" code="188" name="," dataID="" type="" />
					<key funcID="56" code="190" name="." dataID="" type="" />
					<key funcID="57" code="191" name="/" dataID="" type="" />
					<key funcID="58" code="123" name="F12" dataID="" type="1" />
				</single>
				<!--code 组合键动作ID，dataID 动作ID -->
				<mix>
					<!--CTRL+数字 快捷键 -->
					<key func="6,41" dataID="10005" name="7" type="" />
					<key func="6,42" dataID="10005" name="8" type="" />
					<key func="6,43" dataID="10005" name="9" type="" />
					<key func="6,44" dataID="10005" name="10" type="" />
					<key func="6,45" dataID="10005" name="11" type="" />
					<key func="6,46" dataID="10005" name="12" type="" />

					<!--自动挂机开始/结束 ctrl+Z -->
					<key func="226,2" dataID="0" type="2" funName="RunTrust"/>
					<!--切换宠物攻击模式 Ctrl+R -->
					<key func="6,27" dataID="10001" type="" />
					<!--切换角色攻击模式 Ctrl+A -->
					<key func="6,10" dataID="10001" type="" />
					<!--隐藏显示主界面 -->
					<key func="19,20,21" dataID="0" type="1" />
					<key func="59,60" dataID="0" type="1" />
				</mix>
				<!--code 顺序键动作ID，dataID 动作ID -->
				<order>
					<!--跑：上 -->
					<key func="1,1" dataID="10001" type="" />
					<!--跑：下 -->
					<key func="2,2" dataID="10001" type="" />
					<!--跑：左 -->
					<key func="3,3" dataID="10001" type="" />
					<!--跑：右 -->
					<key func="4,4" dataID="10001" type="" />
				</order>
			</root>

		parse(_xml);

		public static function parse(xml : XML) : void
		{
			var xmldata : XML = xml;
			//single(单一按键)
			var xl : XMLList = xmldata.elements(KeyOutType.SINGLE);
			xl = xl.elements(NODE_NAME);
			var item : XML;
			var kInfo : KeyInfo;
			for each (item in xl)
			{
				kInfo = new KeyInfo();
				kInfo.type = int(item.@type);
				kInfo.code = uint(item.@code);
				kInfo.funcID = uint(item.@funcID);
				kInfo.dataID = uint(item.@dataID);
				kInfo.name = String(item.@name);
				kInfo.funName = String(item.@funName);
				_singleHash.add(kInfo.code, kInfo);
			}
			//mix(混合多按键)
			var funcs : Array;
			var mkInfo : MulitKeyInfo;
			var fid : uint;
			xl = xmldata.elements(KeyOutType.MIX);
			xl = xl.elements(NODE_NAME);
			for each (item in xl)
			{
				mkInfo = new MulitKeyInfo();
				mkInfo.funcs = String(item.@func).split(",");
				mkInfo.funcs.sort(Array.NUMERIC); //混合按键不分先后有排序
				mkInfo.name = item.@name;
				mkInfo.dataID = uint(item.@dataID);
				mkInfo.type = int(item.@type);
				for each (fid in mkInfo.funcs)
				{
					kInfo = getSingleInfoForFuncID(fid);
					if (kInfo)
					{
						mkInfo.codes.push(kInfo.code);
					}
				}
				_mixHash.add(mkInfo.funcID, mkInfo);
				GameLog.add(mkInfo.funcs, "混合按键--------------------" + mkInfo.name);
			}
			//order(顺序按键)
			xl = xmldata.elements(KeyOutType.ORDER);
			xl = xl.elements(NODE_NAME);
			for each (item in xl)
			{
				mkInfo = new MulitKeyInfo();
				mkInfo.funcs = String(item.@func).split(",");
				mkInfo.dataID = uint(item.@dataID);
				mkInfo.type = int(item.@type);
				for each (fid in mkInfo.funcs)
				{
					kInfo = getSingleInfoForFuncID(fid);
					if (kInfo)
					{
						mkInfo.codes.push(kInfo.code);
					}
				}
				_orderHash.add(mkInfo.funcID, mkInfo);
				GameLog.add(mkInfo.funcs, "顺序按键--------------------" + mkInfo.name);
			}
		}

		/**
		 * 获取默认单键位对应的信息
		 * @param key
		 * @return
		 *
		 */
		public static function getSingleInfo(keyCode : uint) : KeyInfo
		{
			return _singleHash.getValue(keyCode);
		}

		/**
		 * 获取默认组合键对应的操作ID
		 * @param key
		 * @return
		 *
		 */
		public static function getMixInfo(keyList : Array) : MulitKeyInfo
		{
			var funcs : Array = [];
			var kInfo : KeyInfo;
			keyList.forEach(function(keyCode : uint, index : int, array : Array) : void
			{
				kInfo = _singleHash.getValue(keyCode);
				if (kInfo)
				{
					funcs.push(kInfo.funcID);
				}
			});
			funcs.sort(Array.NUMERIC);
			return _mixHash.getValue(funcs.toString());
		}

		/**
		 * 获取默认顺序键对应的操作ID
		 * @param key
		 * @return
		 *
		 */
		public static function getOrderInfo(keyList : Array) : MulitKeyInfo
		{
			var funcs : Array = [];
			var kInfo : KeyInfo;
			keyList.forEach(function(keyCode : uint, index : int, array : Array) : void
			{
				kInfo = _singleHash.getValue(keyCode);
				if (kInfo)
				{
					funcs.push(kInfo.funcID);
				}
			});
			return _orderHash.getValue(funcs.toString());
		}

		/**
		 * 是否是合法键码
		 * @param key
		 * @return
		 *
		 */
		public static function isLegal(key : uint) : Boolean
		{
			return _singleHash.containsKey(key);
		}

		/**
		 * 克隆单键HashMap 
		 * @return 
		 * 
		 */		
		public static function cloneSingleHash() : HashMap
		{
			var temp : HashMap = new HashMap(_singleHash.weakKeys);
			_singleHash.forEach(function(key : uint, value : KeyInfo) : void
			{
				temp.add(key, value.clone());
			});
			return temp;
		}

		/**
		 * 克隆组合键HashMap 
		 * @return 
		 * 
		 */		
		public static function cloneMixHash() : HashMap
		{
			var temp : HashMap = new HashMap(_mixHash.weakKeys);
			_mixHash.forEach(function(key : String, value : MulitKeyInfo) : void
			{
				temp.add(key, value.clone());
			});
			return temp;
		}

		/**
		 * 克隆顺序键HashMap 
		 * @return 
		 * 
		 */		
		public static function cloneOrderHash() : HashMap
		{
			var temp : HashMap = new HashMap(_orderHash.weakKeys);
			_orderHash.forEach(function(key : String, value : MulitKeyInfo) : void
			{
				temp.add(key, value.clone());
			});
			return temp;
		}

		public static function getSingleInfoForFuncID(funcID : uint) : KeyInfo
		{
			var info : KeyInfo;
			_singleHash.some(function(key : uint, value : KeyInfo) : Boolean
			{
				if (value.funcID == funcID)
				{
					info = value;
					return true;
				}
				return false;
			});
			return info;
		}
	}
}
