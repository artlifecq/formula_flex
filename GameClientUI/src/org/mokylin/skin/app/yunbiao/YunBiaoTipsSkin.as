package org.mokylin.skin.app.yunbiao
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class YunBiaoTipsSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var labDesc:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function YunBiaoTipsSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 150;
			this.width = 200;
			this.elementsContent = [__YunBiaoTipsSkin_UIAsset1_i(),labDesc_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __YunBiaoTipsSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 150;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/san_ji_mian_ban.png";
			temp.width = 200;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
			temp.x = 167;
			temp.y = 3;
			return temp;
		}

		private function labDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc = temp;
			temp.name = "labDesc";
			temp.height = 96;
			temp.leading = 8;
			temp.text = "真遗憾，你押送的镖车被劫！把这辆破损的镖车送到边境军需官处，还可以获得一些补偿。";
			temp.width = 160;
			temp.x = 20;
			temp.y = 43;
			return temp;
		}

	}
}