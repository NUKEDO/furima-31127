require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録に成功する' do
      it '全てのカラムに正しく入力されているので登録される' do
        expect(@user).to be_valid
      end
      it 'nicknameが40文字以下で登録できる' do
        @user.nickname = '12345678901234567890abcdefghijklmnopqrst'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で英数字が混ざっていれば登録できる' do
        @user.password = 'Abc123'
        @user.password_confirmation = 'Abc123'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'nicknameが41文字以上だと登録できない' do
        @user.nickname = '12345678901234567890abcdefghijklmnopqrstu'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 40 characters)')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が入っていないと登録できない' do
        @user.email = 'testergmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが重複していると登録できない' do
        @user.email = 'tester@gmail.com'
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが全角英数字だと登録できない' do
        @user.password = 'ｂｃｄ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英字のみで構成されていると登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字のみで構成されていると登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password_confirmationがpasswordと一致しないと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが半角だと登録できない' do
        @user.family_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'family_nameに「平仮名・カタカナ・漢字」以外が含まれていると登録できない' do
        @user.family_name = '2ノ宮'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameに「平仮名・カタカナ・漢字」以外が含まれていると登録できない' do
        @user.first_name = 'タロU'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'family_name_katakanaが空だと登録できない' do
        @user.family_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana can't be blank")
      end
      it 'family_name_katakanaが半角だと登録できない' do
        @user.family_name_katakana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name katakana is invalid')
      end
      it 'family_name_katakanaにカタカナ以外の文字が使われていると登録できない' do
        @user.family_name_katakana = 'ニノミy'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name katakana is invalid')
      end
      it 'first_name_katakanaが空だと登録できない' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it 'first_name_katakanaが半角だと登録できない' do
        @user.first_name_katakana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana is invalid')
      end
      it 'first_name_katakanaにカタカナ以外の文字が使われていると登録できない' do
        @user.first_name_katakana = '@タロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'birthdayの「年・月・日」のいずれかが空では登録できない' do
        @user.birthday = '1930----29'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
