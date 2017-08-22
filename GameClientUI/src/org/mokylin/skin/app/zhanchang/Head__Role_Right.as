package org.mokylin.skin.app.zhanchang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Head__Role_Right extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbName:feathers.controls.Label;

		public var numZhandouli:feathers.controls.UINumber;

		public var role_xuecao:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head__Role_Right()
		{
			super();
			
			this.currentState = "normal";
			this.height = 88;
			this.width = 341;
			this.elementsContent = [__Head__Role_Right_UIAsset1_i(),role_xuecao_i(),lbName_i(),__Head__Role_Right_UIAsset2_i(),numZhandouli_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Head__Role_Right_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/zhanchang/scene/touxiangkuang.png";
			temp.x = 341;
			temp.y = 0;
			return temp;
		}

		private function __Head__Role_Right_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zhandouli2.png";
			temp.x = 106;
			temp.y = 0;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.bold = false;
			temp.text = "角色名六个字 (120级)";
			temp.textAlign = "right";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 101;
			temp.y = 29;
			return temp;
		}

		private function numZhandouli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numZhandouli = temp;
			temp.name = "numZhandouli";
			temp.gap = -6;
			temp.height = 25;
			temp.label = "629845";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 142;
			temp.x = 162;
			temp.y = 3;
			return temp;
		}

		private function role_xuecao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			role_xuecao = temp;
			temp.name = "role_xuecao";
			temp.styleName = "ui/app/zhanchang/scene/xuetiao.png";
			temp.x = 18;
			temp.y = 49;
			return temp;
		}

	}
}