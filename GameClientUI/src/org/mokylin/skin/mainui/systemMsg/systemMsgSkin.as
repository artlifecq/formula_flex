package org.mokylin.skin.mainui.systemMsg
{
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.mainui.systemMsg.button.ButtonSkin_jiahao;
	import org.mokylin.skin.mainui.systemMsg.button.ButtonSkin_jianhao;
	import org.mokylin.skin.mainui.systemMsg.button.ButtonSkin_xiangxi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class systemMsgSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btn_jia:feathers.controls.Button;

		public var btn_jian:feathers.controls.Button;

		public var btn_xiangxi:feathers.controls.Button;

		public var msg_list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function systemMsgSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 134;
			this.width = 241;
			this.elementsContent = [bg_i(),btn_xiangxi_i(),btn_jia_i(),btn_jian_i(),msg_list_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 134;
			temp.styleName = "ui/mainui/systemMsg/di.png";
			temp.width = 241;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_jia_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jia = temp;
			temp.name = "btn_jia";
			temp.styleClass = org.mokylin.skin.mainui.systemMsg.button.ButtonSkin_jiahao;
			temp.x = 214;
			temp.y = 108;
			return temp;
		}

		private function btn_jian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jian = temp;
			temp.name = "btn_jian";
			temp.styleClass = org.mokylin.skin.mainui.systemMsg.button.ButtonSkin_jianhao;
			temp.x = 214;
			temp.y = 108;
			return temp;
		}

		private function btn_xiangxi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_xiangxi = temp;
			temp.name = "btn_xiangxi";
			temp.height = 25;
			temp.labelOffsetX = 0;
			temp.styleClass = org.mokylin.skin.mainui.systemMsg.button.ButtonSkin_xiangxi;
			temp.width = 46;
			temp.x = 168;
			temp.y = 108;
			return temp;
		}

		private function msg_list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			msg_list = temp;
			temp.name = "msg_list";
			temp.height = 108;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 241;
			temp.y = 0;
			return temp;
		}

	}
}