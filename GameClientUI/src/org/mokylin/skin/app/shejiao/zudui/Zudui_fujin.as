package org.mokylin.skin.app.shejiao.zudui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.shejiao.zudui.Duiwu_Head;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zudui_fujin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Duiwu_list:feathers.controls.List;

		public var btn_chakan:feathers.controls.Button;

		public var btn_shenqing:feathers.controls.Button;

		public var btn_shuaixin:feathers.controls.Button;

		public var sk_head:feathers.controls.SkinnableContainer;

		public var ui_fujin:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zudui_fujin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 429;
			this.width = 911;
			this.elementsContent = [btn_shuaixin_i(),btn_chakan_i(),btn_shenqing_i(),Duiwu_list_i(),sk_head_i(),ui_fujin_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Duiwu_list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			Duiwu_list = temp;
			temp.name = "Duiwu_list";
			temp.height = 347;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 911;
			temp.x = 0;
			temp.y = 26;
			return temp;
		}

		private function btn_chakan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_chakan = temp;
			temp.name = "btn_chakan";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "查看队长";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 709;
			temp.y = 393;
			return temp;
		}

		private function btn_shenqing_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shenqing = temp;
			temp.name = "btn_shenqing";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "申请入队";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 808;
			temp.y = 393;
			return temp;
		}

		private function btn_shuaixin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuaixin = temp;
			temp.name = "btn_shuaixin";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "刷新列表";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 7;
			temp.y = 393;
			return temp;
		}

		private function sk_head_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sk_head = temp;
			temp.name = "sk_head";
			temp.height = 26;
			var skin:StateSkin = new org.mokylin.skin.app.shejiao.zudui.Duiwu_Head()
			temp.skin = skin
			temp.width = 910;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function ui_fujin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_fujin = temp;
			temp.name = "ui_fujin";
			temp.styleName = "ui/app/shejiao/zudui/fujinmeiyouduiwu.png";
			temp.x = 310;
			temp.y = 168;
			return temp;
		}

	}
}