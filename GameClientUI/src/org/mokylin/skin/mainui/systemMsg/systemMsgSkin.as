package org.mokylin.skin.mainui.systemMsg
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.list.ListSkin1;

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

		public var msg_list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function systemMsgSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 106;
			this.width = 263;
			this.elementsContent = [bg_i(),msg_list_i(),btn_jian_i(),btn_jia_i()];
			
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
			temp.height = 106;
			temp.styleName = "ui/mainui/systemMsg/di.png";
			temp.width = 263;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_jia_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jia = temp;
			temp.name = "btn_jia";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 241;
			temp.y = 82;
			return temp;
		}

		private function btn_jian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jian = temp;
			temp.name = "btn_jian";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 241;
			temp.y = 82;
			return temp;
		}

		private function msg_list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			msg_list = temp;
			temp.name = "msg_list";
			temp.height = 104;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 262;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}