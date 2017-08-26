package org.mokylin.skin.app.baoguo
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.baoguo.button.ButtonChoushou;
	import org.mokylin.skin.app.baoguo.button.ButtonDuanzao;
	import org.mokylin.skin.app.baoguo.button.ButtonGuanbi;
	import org.mokylin.skin.app.baoguo.button.ButtonZhengli;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BaoGuo_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnChushou:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnDuanzao:feathers.controls.Button;

		public var btnZhengli:feathers.controls.Button;

		public var chkTips:feathers.controls.Check;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BaoGuo_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 253;
			this.width = 505;
			this.elementsContent = [bg_i(),btnDuanzao_i(),btnChushou_i(),btnZhengli_i(),btnClose_i(),chkTips_i(),__BaoGuo_Skin_Label1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BaoGuo_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "本次操作不再提示";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 282;
			temp.y = 206;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/baoguo/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnChushou_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChushou = temp;
			temp.name = "btnChushou";
			temp.styleClass = org.mokylin.skin.app.baoguo.button.ButtonChoushou;
			temp.x = 293;
			temp.y = 122;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.app.baoguo.button.ButtonGuanbi;
			temp.x = 470;
			temp.y = 32;
			return temp;
		}

		private function btnDuanzao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDuanzao = temp;
			temp.name = "btnDuanzao";
			temp.styleClass = org.mokylin.skin.app.baoguo.button.ButtonDuanzao;
			temp.x = 209;
			temp.y = 122;
			return temp;
		}

		private function btnZhengli_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZhengli = temp;
			temp.name = "btnZhengli";
			temp.styleClass = org.mokylin.skin.app.baoguo.button.ButtonZhengli;
			temp.x = 382;
			temp.y = 122;
			return temp;
		}

		private function chkTips_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkTips = temp;
			temp.name = "chkTips";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.width = 23;
			temp.x = 254;
			temp.y = 204;
			return temp;
		}

	}
}