package org.mokylin.skin.app.family
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyMembersInfoListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgEff:feathers.controls.UIAsset;

		public var labActive:feathers.controls.Label;

		public var labDesignation:feathers.controls.Label;

		public var labExp:feathers.controls.Label;

		public var labGongXun:feathers.controls.Label;

		public var labJob:feathers.controls.Label;

		public var labLevel:feathers.controls.Label;

		public var labNickname:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyMembersInfoListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 750;
			this.elementsContent = [imgEff_i(),labNickname_i(),labLevel_i(),labJob_i(),labGongXun_i(),labDesignation_i(),labExp_i(),labActive_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgEff_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgEff = temp;
			temp.name = "imgEff";
			temp.height = 25;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 750;
			temp.x = -1;
			temp.y = 2;
			return temp;
		}

		private function labActive_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labActive = temp;
			temp.name = "labActive";
			temp.text = "家族活跃";
			temp.textAlign = "center";
			temp.color = 0xFF7F00;
			temp.width = 92;
			temp.x = 647;
			temp.y = 6;
			return temp;
		}

		private function labDesignation_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesignation = temp;
			temp.name = "labDesignation";
			temp.text = "称号";
			temp.textAlign = "center";
			temp.color = 0xFF7F00;
			temp.width = 137;
			temp.x = 433;
			temp.y = 6;
			return temp;
		}

		private function labExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labExp = temp;
			temp.name = "labExp";
			temp.text = "经验分享";
			temp.textAlign = "center";
			temp.color = 0xFF7F00;
			temp.x = 585;
			temp.y = 6;
			return temp;
		}

		private function labGongXun_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGongXun = temp;
			temp.name = "labGongXun";
			temp.text = "家族功勋";
			temp.textAlign = "center";
			temp.color = 0xFF7F00;
			temp.width = 89;
			temp.x = 327;
			temp.y = 6;
			return temp;
		}

		private function labJob_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labJob = temp;
			temp.name = "labJob";
			temp.text = "职位";
			temp.textAlign = "center";
			temp.color = 0xFF7F00;
			temp.width = 80;
			temp.x = 239;
			temp.y = 6;
			return temp;
		}

		private function labLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLevel = temp;
			temp.name = "labLevel";
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xFF7F00;
			temp.width = 54;
			temp.x = 161;
			temp.y = 6;
			return temp;
		}

		private function labNickname_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labNickname = temp;
			temp.name = "labNickname";
			temp.text = "昵称";
			temp.textAlign = "center";
			temp.color = 0xFF7F00;
			temp.width = 135;
			temp.x = 3;
			temp.y = 6;
			return temp;
		}

	}
}