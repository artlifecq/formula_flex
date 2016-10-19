package org.mokylin.skin.app.team.item
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamApplyJoinWaitItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnNO:feathers.controls.Button;

		public var btnOK:feathers.controls.Button;

		public var iconRace:feathers.controls.UIAsset;

		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var labFighting:feathers.controls.Label;

		public var labLv:feathers.controls.Label;

		public var labPlayerName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamApplyJoinWaitItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 570;
			this.elementsContent = [itemBg_i(),itemSelected_i(),iconRace_i(),labPlayerName_i(),labLv_i(),labFighting_i(),btnOK_i(),btnNO_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnNO_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNO = temp;
			temp.name = "btnNO";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 31;
			temp.label = "拒绝";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 60;
			temp.x = 485;
			temp.y = 5;
			return temp;
		}

		private function btnOK_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOK = temp;
			temp.name = "btnOK";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 31;
			temp.label = "同意";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 60;
			temp.x = 420;
			temp.y = 5;
			return temp;
		}

		private function iconRace_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconRace = temp;
			temp.name = "iconRace";
			temp.height = 30;
			temp.styleName = "ui/common/version_3/T_tubiao/T_tongyongxiaotubiao/job_badao.png";
			temp.width = 28;
			temp.x = 8;
			temp.y = 3;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 40;
			temp.styleName = "ui/app/country/niupizhi/lieditiao_xiao.png";
			temp.width = 570;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemSelected_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelected = temp;
			temp.name = "itemSelected";
			temp.height = 40;
			temp.styleName = "ui/common/liebiao/select.png";
			temp.width = 570;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labFighting_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labFighting = temp;
			temp.name = "labFighting";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "999999999";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 135;
			temp.x = 285;
			temp.y = 12;
			return temp;
		}

		private function labLv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLv = temp;
			temp.name = "labLv";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 135;
			temp.x = 150;
			temp.y = 11;
			return temp;
		}

		private function labPlayerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPlayerName = temp;
			temp.name = "labPlayerName";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "玩家名称七个字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 130;
			temp.x = 20;
			temp.y = 11;
			return temp;
		}

	}
}