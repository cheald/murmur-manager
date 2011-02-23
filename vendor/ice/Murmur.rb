# **********************************************************************
#
# Copyright (c) 2003-2009 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

# Ice version 3.3.1
# Generated from file `Murmur.ice'

require 'Ice'
require 'Ice/SliceChecksumDict.rb'

module Murmur

    if not defined?(::Murmur::T_NetAddress)
        T_NetAddress = ::Ice::__defineSequence('::Murmur::NetAddress', ::Ice::T_byte)
    end

    if not defined?(::Murmur::User)
        class User
            def initialize(session=0, userid=0, mute=false, deaf=false, suppress=false, prioritySpeaker=false, selfMute=false, selfDeaf=false, recording=false, channel=0, name='', onlinesecs=0, bytespersec=0, version=0, release='', os='', osversion='', identity='', context='', comment='', address=nil, tcponly=false, idlesecs=0)
                @session = session
                @userid = userid
                @mute = mute
                @deaf = deaf
                @suppress = suppress
                @prioritySpeaker = prioritySpeaker
                @selfMute = selfMute
                @selfDeaf = selfDeaf
                @recording = recording
                @channel = channel
                @name = name
                @onlinesecs = onlinesecs
                @bytespersec = bytespersec
                @version = version
                @release = release
                @os = os
                @osversion = osversion
                @identity = identity
                @context = context
                @comment = comment
                @address = address
                @tcponly = tcponly
                @idlesecs = idlesecs
            end

            def hash
                _h = 0
                _h = 5 * _h + @session.hash
                _h = 5 * _h + @userid.hash
                _h = 5 * _h + @mute.hash
                _h = 5 * _h + @deaf.hash
                _h = 5 * _h + @suppress.hash
                _h = 5 * _h + @prioritySpeaker.hash
                _h = 5 * _h + @selfMute.hash
                _h = 5 * _h + @selfDeaf.hash
                _h = 5 * _h + @recording.hash
                _h = 5 * _h + @channel.hash
                _h = 5 * _h + @name.hash
                _h = 5 * _h + @onlinesecs.hash
                _h = 5 * _h + @bytespersec.hash
                _h = 5 * _h + @version.hash
                _h = 5 * _h + @release.hash
                _h = 5 * _h + @os.hash
                _h = 5 * _h + @osversion.hash
                _h = 5 * _h + @identity.hash
                _h = 5 * _h + @context.hash
                _h = 5 * _h + @comment.hash
                _h = 5 * _h + @address.hash
                _h = 5 * _h + @tcponly.hash
                _h = 5 * _h + @idlesecs.hash
                _h % 0x7fffffff
            end

            def ==(other)
                return false if
                    @session != other.session or
                    @userid != other.userid or
                    @mute != other.mute or
                    @deaf != other.deaf or
                    @suppress != other.suppress or
                    @prioritySpeaker != other.prioritySpeaker or
                    @selfMute != other.selfMute or
                    @selfDeaf != other.selfDeaf or
                    @recording != other.recording or
                    @channel != other.channel or
                    @name != other.name or
                    @onlinesecs != other.onlinesecs or
                    @bytespersec != other.bytespersec or
                    @version != other.version or
                    @release != other.release or
                    @os != other.os or
                    @osversion != other.osversion or
                    @identity != other.identity or
                    @context != other.context or
                    @comment != other.comment or
                    @address != other.address or
                    @tcponly != other.tcponly or
                    @idlesecs != other.idlesecs
                true
            end

            def eql?(other)
                return other.class == self.class && other == self
            end

            def inspect
                ::Ice::__stringify(self, T_User)
            end

            attr_accessor :session, :userid, :mute, :deaf, :suppress, :prioritySpeaker, :selfMute, :selfDeaf, :recording, :channel, :name, :onlinesecs, :bytespersec, :version, :release, :os, :osversion, :identity, :context, :comment, :address, :tcponly, :idlesecs
        end

        T_User = ::Ice::__defineStruct('::Murmur::User', User, [
            ["session", ::Ice::T_int],
            ["userid", ::Ice::T_int],
            ["mute", ::Ice::T_bool],
            ["deaf", ::Ice::T_bool],
            ["suppress", ::Ice::T_bool],
            ["prioritySpeaker", ::Ice::T_bool],
            ["selfMute", ::Ice::T_bool],
            ["selfDeaf", ::Ice::T_bool],
            ["recording", ::Ice::T_bool],
            ["channel", ::Ice::T_int],
            ["name", ::Ice::T_string],
            ["onlinesecs", ::Ice::T_int],
            ["bytespersec", ::Ice::T_int],
            ["version", ::Ice::T_int],
            ["release", ::Ice::T_string],
            ["os", ::Ice::T_string],
            ["osversion", ::Ice::T_string],
            ["identity", ::Ice::T_string],
            ["context", ::Ice::T_string],
            ["comment", ::Ice::T_string],
            ["address", ::Murmur::T_NetAddress],
            ["tcponly", ::Ice::T_bool],
            ["idlesecs", ::Ice::T_int]
        ])
    end

    if not defined?(::Murmur::T_IntList)
        T_IntList = ::Ice::__defineSequence('::Murmur::IntList', ::Ice::T_int)
    end

    if not defined?(::Murmur::Channel)
        class Channel
            def initialize(id=0, name='', parent=0, links=nil, description='', temporary=false, position=0)
                @id = id
                @name = name
                @parent = parent
                @links = links
                @description = description
                @temporary = temporary
                @position = position
            end

            def hash
                _h = 0
                _h = 5 * _h + @id.hash
                _h = 5 * _h + @name.hash
                _h = 5 * _h + @parent.hash
                _h = 5 * _h + @links.hash
                _h = 5 * _h + @description.hash
                _h = 5 * _h + @temporary.hash
                _h = 5 * _h + @position.hash
                _h % 0x7fffffff
            end

            def ==(other)
                return false if
                    @id != other.id or
                    @name != other.name or
                    @parent != other.parent or
                    @links != other.links or
                    @description != other.description or
                    @temporary != other.temporary or
                    @position != other.position
                true
            end

            def eql?(other)
                return other.class == self.class && other == self
            end

            def inspect
                ::Ice::__stringify(self, T_Channel)
            end

            attr_accessor :id, :name, :parent, :links, :description, :temporary, :position
        end

        T_Channel = ::Ice::__defineStruct('::Murmur::Channel', Channel, [
            ["id", ::Ice::T_int],
            ["name", ::Ice::T_string],
            ["parent", ::Ice::T_int],
            ["links", ::Murmur::T_IntList],
            ["description", ::Ice::T_string],
            ["temporary", ::Ice::T_bool],
            ["position", ::Ice::T_int]
        ])
    end

    if not defined?(::Murmur::Group)
        class Group
            def initialize(name='', inherited=false, inherit=false, inheritable=false, add=nil, remove=nil, members=nil)
                @name = name
                @inherited = inherited
                @inherit = inherit
                @inheritable = inheritable
                @add = add
                @remove = remove
                @members = members
            end

            def hash
                _h = 0
                _h = 5 * _h + @name.hash
                _h = 5 * _h + @inherited.hash
                _h = 5 * _h + @inherit.hash
                _h = 5 * _h + @inheritable.hash
                _h = 5 * _h + @add.hash
                _h = 5 * _h + @remove.hash
                _h = 5 * _h + @members.hash
                _h % 0x7fffffff
            end

            def ==(other)
                return false if
                    @name != other.name or
                    @inherited != other.inherited or
                    @inherit != other.inherit or
                    @inheritable != other.inheritable or
                    @add != other.add or
                    @remove != other.remove or
                    @members != other.members
                true
            end

            def eql?(other)
                return other.class == self.class && other == self
            end

            def inspect
                ::Ice::__stringify(self, T_Group)
            end

            attr_accessor :name, :inherited, :inherit, :inheritable, :add, :remove, :members
        end

        T_Group = ::Ice::__defineStruct('::Murmur::Group', Group, [
            ["name", ::Ice::T_string],
            ["inherited", ::Ice::T_bool],
            ["inherit", ::Ice::T_bool],
            ["inheritable", ::Ice::T_bool],
            ["add", ::Murmur::T_IntList],
            ["remove", ::Murmur::T_IntList],
            ["members", ::Murmur::T_IntList]
        ])
    end

    PermissionWrite = 1

    PermissionTraverse = 2

    PermissionEnter = 4

    PermissionSpeak = 8

    PermissionWhisper = 256

    PermissionMuteDeafen = 16

    PermissionMove = 32

    PermissionMakeChannel = 64

    PermissionMakeTempChannel = 1024

    PermissionLinkChannel = 128

    PermissionTextMessage = 512

    PermissionKick = 65536

    PermissionBan = 131072

    PermissionRegister = 262144

    PermissionRegisterSelf = 524288

    if not defined?(::Murmur::ACL)
        class ACL
            def initialize(applyHere=false, applySubs=false, inherited=false, userid=0, group='', allow=0, deny=0)
                @applyHere = applyHere
                @applySubs = applySubs
                @inherited = inherited
                @userid = userid
                @group = group
                @allow = allow
                @deny = deny
            end

            def hash
                _h = 0
                _h = 5 * _h + @applyHere.hash
                _h = 5 * _h + @applySubs.hash
                _h = 5 * _h + @inherited.hash
                _h = 5 * _h + @userid.hash
                _h = 5 * _h + @group.hash
                _h = 5 * _h + @allow.hash
                _h = 5 * _h + @deny.hash
                _h % 0x7fffffff
            end

            def ==(other)
                return false if
                    @applyHere != other.applyHere or
                    @applySubs != other.applySubs or
                    @inherited != other.inherited or
                    @userid != other.userid or
                    @group != other.group or
                    @allow != other.allow or
                    @deny != other.deny
                true
            end

            def eql?(other)
                return other.class == self.class && other == self
            end

            def inspect
                ::Ice::__stringify(self, T_ACL)
            end

            attr_accessor :applyHere, :applySubs, :inherited, :userid, :group, :allow, :deny
        end

        T_ACL = ::Ice::__defineStruct('::Murmur::ACL', ACL, [
            ["applyHere", ::Ice::T_bool],
            ["applySubs", ::Ice::T_bool],
            ["inherited", ::Ice::T_bool],
            ["userid", ::Ice::T_int],
            ["group", ::Ice::T_string],
            ["allow", ::Ice::T_int],
            ["deny", ::Ice::T_int]
        ])
    end

    if not defined?(::Murmur::Ban)
        class Ban
            def initialize(address=nil, bits=0, name='', _hash='', reason='', start=0, duration=0)
                @address = address
                @bits = bits
                @name = name
                @_hash = _hash
                @reason = reason
                @start = start
                @duration = duration
            end

            def hash
                _h = 0
                _h = 5 * _h + @address.hash
                _h = 5 * _h + @bits.hash
                _h = 5 * _h + @name.hash
                _h = 5 * _h + @_hash.hash
                _h = 5 * _h + @reason.hash
                _h = 5 * _h + @start.hash
                _h = 5 * _h + @duration.hash
                _h % 0x7fffffff
            end

            def ==(other)
                return false if
                    @address != other.address or
                    @bits != other.bits or
                    @name != other.name or
                    @_hash != other._hash or
                    @reason != other.reason or
                    @start != other.start or
                    @duration != other.duration
                true
            end

            def eql?(other)
                return other.class == self.class && other == self
            end

            def inspect
                ::Ice::__stringify(self, T_Ban)
            end

            attr_accessor :address, :bits, :name, :_hash, :reason, :start, :duration
        end

        T_Ban = ::Ice::__defineStruct('::Murmur::Ban', Ban, [
            ["address", ::Murmur::T_NetAddress],
            ["bits", ::Ice::T_int],
            ["name", ::Ice::T_string],
            ["_hash", ::Ice::T_string],
            ["reason", ::Ice::T_string],
            ["start", ::Ice::T_int],
            ["duration", ::Ice::T_int]
        ])
    end

    if not defined?(::Murmur::LogEntry)
        class LogEntry
            def initialize(timestamp=0, txt='')
                @timestamp = timestamp
                @txt = txt
            end

            def hash
                _h = 0
                _h = 5 * _h + @timestamp.hash
                _h = 5 * _h + @txt.hash
                _h % 0x7fffffff
            end

            def ==(other)
                return false if
                    @timestamp != other.timestamp or
                    @txt != other.txt
                true
            end

            def eql?(other)
                return other.class == self.class && other == self
            end

            def inspect
                ::Ice::__stringify(self, T_LogEntry)
            end

            attr_accessor :timestamp, :txt
        end

        T_LogEntry = ::Ice::__defineStruct('::Murmur::LogEntry', LogEntry, [
            ["timestamp", ::Ice::T_int],
            ["txt", ::Ice::T_string]
        ])
    end

    if not defined?(::Murmur::T_Tree)
        T_Tree = ::Ice::__declareClass('::Murmur::Tree')
        T_TreePrx = ::Ice::__declareProxy('::Murmur::Tree')
    end

    if not defined?(::Murmur::T_TreeList)
        T_TreeList = ::Ice::__defineSequence('::Murmur::TreeList', ::Murmur::T_Tree)
    end

    if not defined?(::Murmur::ChannelInfo)
        class ChannelInfo
            include Comparable

            def initialize(val)
                fail("invalid value #{val} for ChannelInfo") unless(val >= 0 and val < 2)
                @val = val
            end

            def ChannelInfo.from_int(val)
                raise IndexError, "#{val} is out of range 0..1" if(val < 0 || val > 1)
                @@_values[val]
            end

            def to_s
                @@_names[@val]
            end

            def to_i
                @val
            end

            def <=>(other)
                other.is_a?(ChannelInfo) or raise ArgumentError, "value must be a ChannelInfo"
                @val <=> other.to_i
            end

            def hash
                @val.hash
            end

            def inspect
                @@_names[@val] + "(#{@val})"
            end

            def ChannelInfo.each(&block)
                @@_values.each(&block)
            end

            @@_names = ['ChannelDescription', 'ChannelPosition']
            @@_values = [ChannelInfo.new(0), ChannelInfo.new(1)]

            ChannelDescription = @@_values[0]
            ChannelPosition = @@_values[1]

            private_class_method :new
        end

        T_ChannelInfo = ::Ice::__defineEnum('::Murmur::ChannelInfo', ChannelInfo, [ChannelInfo::ChannelDescription, ChannelInfo::ChannelPosition])
    end

    if not defined?(::Murmur::UserInfo)
        class UserInfo
            include Comparable

            def initialize(val)
                fail("invalid value #{val} for UserInfo") unless(val >= 0 and val < 6)
                @val = val
            end

            def UserInfo.from_int(val)
                raise IndexError, "#{val} is out of range 0..5" if(val < 0 || val > 5)
                @@_values[val]
            end

            def to_s
                @@_names[@val]
            end

            def to_i
                @val
            end

            def <=>(other)
                other.is_a?(UserInfo) or raise ArgumentError, "value must be a UserInfo"
                @val <=> other.to_i
            end

            def hash
                @val.hash
            end

            def inspect
                @@_names[@val] + "(#{@val})"
            end

            def UserInfo.each(&block)
                @@_values.each(&block)
            end

            @@_names = ['UserName', 'UserEmail', 'UserComment', 'UserHash', 'UserPassword', 'UserLastActive']
            @@_values = [UserInfo.new(0), UserInfo.new(1), UserInfo.new(2), UserInfo.new(3), UserInfo.new(4), UserInfo.new(5)]

            UserName = @@_values[0]
            UserEmail = @@_values[1]
            UserComment = @@_values[2]
            UserHash = @@_values[3]
            UserPassword = @@_values[4]
            UserLastActive = @@_values[5]

            private_class_method :new
        end

        T_UserInfo = ::Ice::__defineEnum('::Murmur::UserInfo', UserInfo, [UserInfo::UserName, UserInfo::UserEmail, UserInfo::UserComment, UserInfo::UserHash, UserInfo::UserPassword, UserInfo::UserLastActive])
    end

    if not defined?(::Murmur::T_UserMap)
        T_UserMap = ::Ice::__defineDictionary('::Murmur::UserMap', ::Ice::T_int, ::Murmur::T_User)
    end

    if not defined?(::Murmur::T_ChannelMap)
        T_ChannelMap = ::Ice::__defineDictionary('::Murmur::ChannelMap', ::Ice::T_int, ::Murmur::T_Channel)
    end

    if not defined?(::Murmur::T_ChannelList)
        T_ChannelList = ::Ice::__defineSequence('::Murmur::ChannelList', ::Murmur::T_Channel)
    end

    if not defined?(::Murmur::T_UserList)
        T_UserList = ::Ice::__defineSequence('::Murmur::UserList', ::Murmur::T_User)
    end

    if not defined?(::Murmur::T_GroupList)
        T_GroupList = ::Ice::__defineSequence('::Murmur::GroupList', ::Murmur::T_Group)
    end

    if not defined?(::Murmur::T_ACLList)
        T_ACLList = ::Ice::__defineSequence('::Murmur::ACLList', ::Murmur::T_ACL)
    end

    if not defined?(::Murmur::T_LogList)
        T_LogList = ::Ice::__defineSequence('::Murmur::LogList', ::Murmur::T_LogEntry)
    end

    if not defined?(::Murmur::T_BanList)
        T_BanList = ::Ice::__defineSequence('::Murmur::BanList', ::Murmur::T_Ban)
    end

    if not defined?(::Murmur::T_IdList)
        T_IdList = ::Ice::__defineSequence('::Murmur::IdList', ::Ice::T_int)
    end

    if not defined?(::Murmur::T_NameList)
        T_NameList = ::Ice::__defineSequence('::Murmur::NameList', ::Ice::T_string)
    end

    if not defined?(::Murmur::T_NameMap)
        T_NameMap = ::Ice::__defineDictionary('::Murmur::NameMap', ::Ice::T_int, ::Ice::T_string)
    end

    if not defined?(::Murmur::T_IdMap)
        T_IdMap = ::Ice::__defineDictionary('::Murmur::IdMap', ::Ice::T_string, ::Ice::T_int)
    end

    if not defined?(::Murmur::T_Texture)
        T_Texture = ::Ice::__defineSequence('::Murmur::Texture', ::Ice::T_byte)
    end

    if not defined?(::Murmur::T_ConfigMap)
        T_ConfigMap = ::Ice::__defineDictionary('::Murmur::ConfigMap', ::Ice::T_string, ::Ice::T_string)
    end

    if not defined?(::Murmur::T_GroupNameList)
        T_GroupNameList = ::Ice::__defineSequence('::Murmur::GroupNameList', ::Ice::T_string)
    end

    if not defined?(::Murmur::T_CertificateDer)
        T_CertificateDer = ::Ice::__defineSequence('::Murmur::CertificateDer', ::Ice::T_byte)
    end

    if not defined?(::Murmur::T_CertificateList)
        T_CertificateList = ::Ice::__defineSequence('::Murmur::CertificateList', ::Murmur::T_CertificateDer)
    end

    if not defined?(::Murmur::T_UserInfoMap)
        T_UserInfoMap = ::Ice::__defineDictionary('::Murmur::UserInfoMap', ::Murmur::T_UserInfo, ::Ice::T_string)
    end

    if not defined?(::Murmur::Tree_mixin)
        module Tree_mixin
            include ::Ice::Object_mixin

            def ice_ids(current=nil)
                ['::Ice::Object', '::Murmur::Tree']
            end

            def ice_id(current=nil)
                '::Murmur::Tree'
            end

            def inspect
                ::Ice::__stringify(self, T_Tree)
            end

            attr_accessor :c, :children, :users
        end
        class Tree
            include Tree_mixin
            
            def Tree.ice_staticId()
                '::Murmur::Tree'
            end

            def initialize(c=::Murmur::Channel.new, children=nil, users=nil)
                @c = c
                @children = children
                @users = users
            end
        end
        module TreePrx_mixin
        end
        class TreePrx < ::Ice::ObjectPrx
            include TreePrx_mixin

            def TreePrx.checkedCast(proxy, facetOrCtx=nil, _ctx=nil)
                ice_checkedCast(proxy, '::Murmur::Tree', facetOrCtx, _ctx)
            end

            def TreePrx.uncheckedCast(proxy, facet=nil)
                ice_uncheckedCast(proxy, facet)
            end
        end

        if not defined?(::Murmur::T_Tree)
            T_Tree = ::Ice::__declareClass('::Murmur::Tree')
            T_TreePrx = ::Ice::__declareProxy('::Murmur::Tree')
        end

        T_Tree.defineClass(Tree, false, nil, [], [
            ['c', ::Murmur::T_Channel],
            ['children', ::Murmur::T_TreeList],
            ['users', ::Murmur::T_UserList]
        ])
        Tree_mixin::ICE_TYPE = T_Tree

        T_TreePrx.defineProxy(TreePrx, T_Tree)
        TreePrx::ICE_TYPE = T_TreePrx
    end

    if not defined?(::Murmur::MurmurException)
        class MurmurException < Ice::UserException
            def initialize
            end

            def to_s
                'Murmur::MurmurException'
            end

            def inspect
                return ::Ice::__stringifyException(self)
            end
        end

        T_MurmurException = ::Ice::__defineException('::Murmur::MurmurException', MurmurException, nil, [])
        MurmurException::ICE_TYPE = T_MurmurException
    end

    if not defined?(::Murmur::InvalidSessionException)
        class InvalidSessionException < ::Murmur::MurmurException
            def initialize
            end

            def to_s
                'Murmur::InvalidSessionException'
            end

            def inspect
                return ::Ice::__stringifyException(self)
            end
        end

        T_InvalidSessionException = ::Ice::__defineException('::Murmur::InvalidSessionException', InvalidSessionException, ::Murmur::T_MurmurException, [])
        InvalidSessionException::ICE_TYPE = T_InvalidSessionException
    end

    if not defined?(::Murmur::InvalidChannelException)
        class InvalidChannelException < ::Murmur::MurmurException
            def initialize
            end

            def to_s
                'Murmur::InvalidChannelException'
            end

            def inspect
                return ::Ice::__stringifyException(self)
            end
        end

        T_InvalidChannelException = ::Ice::__defineException('::Murmur::InvalidChannelException', InvalidChannelException, ::Murmur::T_MurmurException, [])
        InvalidChannelException::ICE_TYPE = T_InvalidChannelException
    end

    if not defined?(::Murmur::InvalidServerException)
        class InvalidServerException < ::Murmur::MurmurException
            def initialize
            end

            def to_s
                'Murmur::InvalidServerException'
            end

            def inspect
                return ::Ice::__stringifyException(self)
            end
        end

        T_InvalidServerException = ::Ice::__defineException('::Murmur::InvalidServerException', InvalidServerException, ::Murmur::T_MurmurException, [])
        InvalidServerException::ICE_TYPE = T_InvalidServerException
    end

    if not defined?(::Murmur::ServerBootedException)
        class ServerBootedException < ::Murmur::MurmurException
            def initialize
            end

            def to_s
                'Murmur::ServerBootedException'
            end

            def inspect
                return ::Ice::__stringifyException(self)
            end
        end

        T_ServerBootedException = ::Ice::__defineException('::Murmur::ServerBootedException', ServerBootedException, ::Murmur::T_MurmurException, [])
        ServerBootedException::ICE_TYPE = T_ServerBootedException
    end

    if not defined?(::Murmur::ServerFailureException)
        class ServerFailureException < ::Murmur::MurmurException
            def initialize
            end

            def to_s
                'Murmur::ServerFailureException'
            end

            def inspect
                return ::Ice::__stringifyException(self)
            end
        end

        T_ServerFailureException = ::Ice::__defineException('::Murmur::ServerFailureException', ServerFailureException, ::Murmur::T_MurmurException, [])
        ServerFailureException::ICE_TYPE = T_ServerFailureException
    end

    if not defined?(::Murmur::InvalidUserException)
        class InvalidUserException < ::Murmur::MurmurException
            def initialize
            end

            def to_s
                'Murmur::InvalidUserException'
            end

            def inspect
                return ::Ice::__stringifyException(self)
            end
        end

        T_InvalidUserException = ::Ice::__defineException('::Murmur::InvalidUserException', InvalidUserException, ::Murmur::T_MurmurException, [])
        InvalidUserException::ICE_TYPE = T_InvalidUserException
    end

    if not defined?(::Murmur::InvalidTextureException)
        class InvalidTextureException < ::Murmur::MurmurException
            def initialize
            end

            def to_s
                'Murmur::InvalidTextureException'
            end

            def inspect
                return ::Ice::__stringifyException(self)
            end
        end

        T_InvalidTextureException = ::Ice::__defineException('::Murmur::InvalidTextureException', InvalidTextureException, ::Murmur::T_MurmurException, [])
        InvalidTextureException::ICE_TYPE = T_InvalidTextureException
    end

    if not defined?(::Murmur::InvalidCallbackException)
        class InvalidCallbackException < ::Murmur::MurmurException
            def initialize
            end

            def to_s
                'Murmur::InvalidCallbackException'
            end

            def inspect
                return ::Ice::__stringifyException(self)
            end
        end

        T_InvalidCallbackException = ::Ice::__defineException('::Murmur::InvalidCallbackException', InvalidCallbackException, ::Murmur::T_MurmurException, [])
        InvalidCallbackException::ICE_TYPE = T_InvalidCallbackException
    end

    if not defined?(::Murmur::InvalidSecretException)
        class InvalidSecretException < ::Murmur::MurmurException
            def initialize
            end

            def to_s
                'Murmur::InvalidSecretException'
            end

            def inspect
                return ::Ice::__stringifyException(self)
            end
        end

        T_InvalidSecretException = ::Ice::__defineException('::Murmur::InvalidSecretException', InvalidSecretException, ::Murmur::T_MurmurException, [])
        InvalidSecretException::ICE_TYPE = T_InvalidSecretException
    end

    if not defined?(::Murmur::ServerCallback_mixin)
        module ServerCallback_mixin
            include ::Ice::Object_mixin

            def ice_ids(current=nil)
                ['::Ice::Object', '::Murmur::ServerCallback']
            end

            def ice_id(current=nil)
                '::Murmur::ServerCallback'
            end

            #
            # Operation signatures.
            #
            # def userConnected(state, current=nil)
            # def userDisconnected(state, current=nil)
            # def userStateChanged(state, current=nil)
            # def channelCreated(state, current=nil)
            # def channelRemoved(state, current=nil)
            # def channelStateChanged(state, current=nil)

            def inspect
                ::Ice::__stringify(self, T_ServerCallback)
            end
        end
        class ServerCallback
            include ServerCallback_mixin
            
            def ServerCallback.ice_staticId()
                '::Murmur::ServerCallback'
            end
        end
        module ServerCallbackPrx_mixin

            def userConnected(state, _ctx=nil)
                ServerCallback_mixin::OP_userConnected.invoke(self, [state], _ctx)
            end

            def userDisconnected(state, _ctx=nil)
                ServerCallback_mixin::OP_userDisconnected.invoke(self, [state], _ctx)
            end

            def userStateChanged(state, _ctx=nil)
                ServerCallback_mixin::OP_userStateChanged.invoke(self, [state], _ctx)
            end

            def channelCreated(state, _ctx=nil)
                ServerCallback_mixin::OP_channelCreated.invoke(self, [state], _ctx)
            end

            def channelRemoved(state, _ctx=nil)
                ServerCallback_mixin::OP_channelRemoved.invoke(self, [state], _ctx)
            end

            def channelStateChanged(state, _ctx=nil)
                ServerCallback_mixin::OP_channelStateChanged.invoke(self, [state], _ctx)
            end
        end
        class ServerCallbackPrx < ::Ice::ObjectPrx
            include ServerCallbackPrx_mixin

            def ServerCallbackPrx.checkedCast(proxy, facetOrCtx=nil, _ctx=nil)
                ice_checkedCast(proxy, '::Murmur::ServerCallback', facetOrCtx, _ctx)
            end

            def ServerCallbackPrx.uncheckedCast(proxy, facet=nil)
                ice_uncheckedCast(proxy, facet)
            end
        end

        if not defined?(::Murmur::T_ServerCallback)
            T_ServerCallback = ::Ice::__declareClass('::Murmur::ServerCallback')
            T_ServerCallbackPrx = ::Ice::__declareProxy('::Murmur::ServerCallback')
        end

        T_ServerCallback.defineClass(ServerCallback, true, nil, [], [])
        ServerCallback_mixin::ICE_TYPE = T_ServerCallback

        T_ServerCallbackPrx.defineProxy(ServerCallbackPrx, T_ServerCallback)
        ServerCallbackPrx::ICE_TYPE = T_ServerCallbackPrx

        ServerCallback_mixin::OP_userConnected = ::Ice::__defineOperation('userConnected', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Murmur::T_User], [], nil, [])
        ServerCallback_mixin::OP_userDisconnected = ::Ice::__defineOperation('userDisconnected', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Murmur::T_User], [], nil, [])
        ServerCallback_mixin::OP_userStateChanged = ::Ice::__defineOperation('userStateChanged', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Murmur::T_User], [], nil, [])
        ServerCallback_mixin::OP_channelCreated = ::Ice::__defineOperation('channelCreated', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Murmur::T_Channel], [], nil, [])
        ServerCallback_mixin::OP_channelRemoved = ::Ice::__defineOperation('channelRemoved', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Murmur::T_Channel], [], nil, [])
        ServerCallback_mixin::OP_channelStateChanged = ::Ice::__defineOperation('channelStateChanged', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Murmur::T_Channel], [], nil, [])
    end

    ContextServer = 1

    ContextChannel = 2

    ContextUser = 4

    if not defined?(::Murmur::ServerContextCallback_mixin)
        module ServerContextCallback_mixin
            include ::Ice::Object_mixin

            def ice_ids(current=nil)
                ['::Ice::Object', '::Murmur::ServerContextCallback']
            end

            def ice_id(current=nil)
                '::Murmur::ServerContextCallback'
            end

            #
            # Operation signatures.
            #
            # def contextAction(action, usr, session, channelid, current=nil)

            def inspect
                ::Ice::__stringify(self, T_ServerContextCallback)
            end
        end
        class ServerContextCallback
            include ServerContextCallback_mixin
            
            def ServerContextCallback.ice_staticId()
                '::Murmur::ServerContextCallback'
            end
        end
        module ServerContextCallbackPrx_mixin

            def contextAction(action, usr, session, channelid, _ctx=nil)
                ServerContextCallback_mixin::OP_contextAction.invoke(self, [action, usr, session, channelid], _ctx)
            end
        end
        class ServerContextCallbackPrx < ::Ice::ObjectPrx
            include ServerContextCallbackPrx_mixin

            def ServerContextCallbackPrx.checkedCast(proxy, facetOrCtx=nil, _ctx=nil)
                ice_checkedCast(proxy, '::Murmur::ServerContextCallback', facetOrCtx, _ctx)
            end

            def ServerContextCallbackPrx.uncheckedCast(proxy, facet=nil)
                ice_uncheckedCast(proxy, facet)
            end
        end

        if not defined?(::Murmur::T_ServerContextCallback)
            T_ServerContextCallback = ::Ice::__declareClass('::Murmur::ServerContextCallback')
            T_ServerContextCallbackPrx = ::Ice::__declareProxy('::Murmur::ServerContextCallback')
        end

        T_ServerContextCallback.defineClass(ServerContextCallback, true, nil, [], [])
        ServerContextCallback_mixin::ICE_TYPE = T_ServerContextCallback

        T_ServerContextCallbackPrx.defineProxy(ServerContextCallbackPrx, T_ServerContextCallback)
        ServerContextCallbackPrx::ICE_TYPE = T_ServerContextCallbackPrx

        ServerContextCallback_mixin::OP_contextAction = ::Ice::__defineOperation('contextAction', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Ice::T_string, ::Murmur::T_User, ::Ice::T_int, ::Ice::T_int], [], nil, [])
    end

    if not defined?(::Murmur::ServerAuthenticator_mixin)
        module ServerAuthenticator_mixin
            include ::Ice::Object_mixin

            def ice_ids(current=nil)
                ['::Ice::Object', '::Murmur::ServerAuthenticator']
            end

            def ice_id(current=nil)
                '::Murmur::ServerAuthenticator'
            end

            #
            # Operation signatures.
            #
            # def authenticate(name, pw, certificates, certhash, certstrong, current=nil)
            # def getInfo(id, current=nil)
            # def nameToId(name, current=nil)
            # def idToName(id, current=nil)
            # def idToTexture(id, current=nil)

            def inspect
                ::Ice::__stringify(self, T_ServerAuthenticator)
            end
        end
        class ServerAuthenticator
            include ServerAuthenticator_mixin
            
            def ServerAuthenticator.ice_staticId()
                '::Murmur::ServerAuthenticator'
            end
        end
        module ServerAuthenticatorPrx_mixin

            def authenticate(name, pw, certificates, certhash, certstrong, _ctx=nil)
                ServerAuthenticator_mixin::OP_authenticate.invoke(self, [name, pw, certificates, certhash, certstrong], _ctx)
            end

            def getInfo(id, _ctx=nil)
                ServerAuthenticator_mixin::OP_getInfo.invoke(self, [id], _ctx)
            end

            def nameToId(name, _ctx=nil)
                ServerAuthenticator_mixin::OP_nameToId.invoke(self, [name], _ctx)
            end

            def idToName(id, _ctx=nil)
                ServerAuthenticator_mixin::OP_idToName.invoke(self, [id], _ctx)
            end

            def idToTexture(id, _ctx=nil)
                ServerAuthenticator_mixin::OP_idToTexture.invoke(self, [id], _ctx)
            end
        end
        class ServerAuthenticatorPrx < ::Ice::ObjectPrx
            include ServerAuthenticatorPrx_mixin

            def ServerAuthenticatorPrx.checkedCast(proxy, facetOrCtx=nil, _ctx=nil)
                ice_checkedCast(proxy, '::Murmur::ServerAuthenticator', facetOrCtx, _ctx)
            end

            def ServerAuthenticatorPrx.uncheckedCast(proxy, facet=nil)
                ice_uncheckedCast(proxy, facet)
            end
        end

        if not defined?(::Murmur::T_ServerAuthenticator)
            T_ServerAuthenticator = ::Ice::__declareClass('::Murmur::ServerAuthenticator')
            T_ServerAuthenticatorPrx = ::Ice::__declareProxy('::Murmur::ServerAuthenticator')
        end

        T_ServerAuthenticator.defineClass(ServerAuthenticator, true, nil, [], [])
        ServerAuthenticator_mixin::ICE_TYPE = T_ServerAuthenticator

        T_ServerAuthenticatorPrx.defineProxy(ServerAuthenticatorPrx, T_ServerAuthenticator)
        ServerAuthenticatorPrx::ICE_TYPE = T_ServerAuthenticatorPrx

        ServerAuthenticator_mixin::OP_authenticate = ::Ice::__defineOperation('authenticate', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Ice::T_string, ::Ice::T_string, ::Murmur::T_CertificateList, ::Ice::T_string, ::Ice::T_bool], [::Ice::T_string, ::Murmur::T_GroupNameList], ::Ice::T_int, [])
        ServerAuthenticator_mixin::OP_getInfo = ::Ice::__defineOperation('getInfo', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Ice::T_int], [::Murmur::T_UserInfoMap], ::Ice::T_bool, [])
        ServerAuthenticator_mixin::OP_nameToId = ::Ice::__defineOperation('nameToId', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Ice::T_string], [], ::Ice::T_int, [])
        ServerAuthenticator_mixin::OP_idToName = ::Ice::__defineOperation('idToName', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Ice::T_int], [], ::Ice::T_string, [])
        ServerAuthenticator_mixin::OP_idToTexture = ::Ice::__defineOperation('idToTexture', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Ice::T_int], [], ::Murmur::T_Texture, [])
    end

    if not defined?(::Murmur::ServerUpdatingAuthenticator_mixin)
        module ServerUpdatingAuthenticator_mixin
            include ::Ice::Object_mixin

            def ice_ids(current=nil)
                ['::Ice::Object', '::Murmur::ServerAuthenticator', '::Murmur::ServerUpdatingAuthenticator']
            end

            def ice_id(current=nil)
                '::Murmur::ServerUpdatingAuthenticator'
            end

            #
            # Operation signatures.
            #
            # def registerUser(info, current=nil)
            # def unregisterUser(id, current=nil)
            # def getRegisteredUsers(filter, current=nil)
            # def setInfo(id, info, current=nil)
            # def setTexture(id, tex, current=nil)

            def inspect
                ::Ice::__stringify(self, T_ServerUpdatingAuthenticator)
            end
        end
        class ServerUpdatingAuthenticator
            include ServerUpdatingAuthenticator_mixin
            
            def ServerUpdatingAuthenticator.ice_staticId()
                '::Murmur::ServerUpdatingAuthenticator'
            end
        end
        module ServerUpdatingAuthenticatorPrx_mixin
            include ::Murmur::ServerAuthenticatorPrx_mixin

            def registerUser(info, _ctx=nil)
                ServerUpdatingAuthenticator_mixin::OP_registerUser.invoke(self, [info], _ctx)
            end

            def unregisterUser(id, _ctx=nil)
                ServerUpdatingAuthenticator_mixin::OP_unregisterUser.invoke(self, [id], _ctx)
            end

            def getRegisteredUsers(filter, _ctx=nil)
                ServerUpdatingAuthenticator_mixin::OP_getRegisteredUsers.invoke(self, [filter], _ctx)
            end

            def setInfo(id, info, _ctx=nil)
                ServerUpdatingAuthenticator_mixin::OP_setInfo.invoke(self, [id, info], _ctx)
            end

            def setTexture(id, tex, _ctx=nil)
                ServerUpdatingAuthenticator_mixin::OP_setTexture.invoke(self, [id, tex], _ctx)
            end
        end
        class ServerUpdatingAuthenticatorPrx < ::Ice::ObjectPrx
            include ServerUpdatingAuthenticatorPrx_mixin

            def ServerUpdatingAuthenticatorPrx.checkedCast(proxy, facetOrCtx=nil, _ctx=nil)
                ice_checkedCast(proxy, '::Murmur::ServerUpdatingAuthenticator', facetOrCtx, _ctx)
            end

            def ServerUpdatingAuthenticatorPrx.uncheckedCast(proxy, facet=nil)
                ice_uncheckedCast(proxy, facet)
            end
        end

        if not defined?(::Murmur::T_ServerUpdatingAuthenticator)
            T_ServerUpdatingAuthenticator = ::Ice::__declareClass('::Murmur::ServerUpdatingAuthenticator')
            T_ServerUpdatingAuthenticatorPrx = ::Ice::__declareProxy('::Murmur::ServerUpdatingAuthenticator')
        end

        T_ServerUpdatingAuthenticator.defineClass(ServerUpdatingAuthenticator, true, nil, [::Murmur::T_ServerAuthenticator], [])
        ServerUpdatingAuthenticator_mixin::ICE_TYPE = T_ServerUpdatingAuthenticator

        T_ServerUpdatingAuthenticatorPrx.defineProxy(ServerUpdatingAuthenticatorPrx, T_ServerUpdatingAuthenticator)
        ServerUpdatingAuthenticatorPrx::ICE_TYPE = T_ServerUpdatingAuthenticatorPrx

        ServerUpdatingAuthenticator_mixin::OP_registerUser = ::Ice::__defineOperation('registerUser', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, false, [::Murmur::T_UserInfoMap], [], ::Ice::T_int, [])
        ServerUpdatingAuthenticator_mixin::OP_unregisterUser = ::Ice::__defineOperation('unregisterUser', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, false, [::Ice::T_int], [], ::Ice::T_int, [])
        ServerUpdatingAuthenticator_mixin::OP_getRegisteredUsers = ::Ice::__defineOperation('getRegisteredUsers', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Ice::T_string], [], ::Murmur::T_NameMap, [])
        ServerUpdatingAuthenticator_mixin::OP_setInfo = ::Ice::__defineOperation('setInfo', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Ice::T_int, ::Murmur::T_UserInfoMap], [], ::Ice::T_int, [])
        ServerUpdatingAuthenticator_mixin::OP_setTexture = ::Ice::__defineOperation('setTexture', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, false, [::Ice::T_int, ::Murmur::T_Texture], [], ::Ice::T_int, [])
    end

    if not defined?(::Murmur::Server_mixin)
        module Server_mixin
            include ::Ice::Object_mixin

            def ice_ids(current=nil)
                ['::Ice::Object', '::Murmur::Server']
            end

            def ice_id(current=nil)
                '::Murmur::Server'
            end

            #
            # Operation signatures.
            #
            # def isRunning(current=nil)
            # def start(current=nil)
            # def stop(current=nil)
            # def delete(current=nil)
            # def id(current=nil)
            # def addCallback(cb, current=nil)
            # def removeCallback(cb, current=nil)
            # def setAuthenticator(auth, current=nil)
            # def getConf(key, current=nil)
            # def getAllConf(current=nil)
            # def setConf(key, value, current=nil)
            # def setSuperuserPassword(pw, current=nil)
            # def getLog(first, last, current=nil)
            # def getLogLen(current=nil)
            # def getUsers(current=nil)
            # def getChannels(current=nil)
            # def getCertificateList(session, current=nil)
            # def getTree(current=nil)
            # def getBans(current=nil)
            # def setBans(bans, current=nil)
            # def kickUser(session, reason, current=nil)
            # def getState(session, current=nil)
            # def setState(state, current=nil)
            # def sendMessage(session, text, current=nil)
            # def hasPermission(session, channelid, perm, current=nil)
            # def addContextCallback(session, action, text, cb, ctx, current=nil)
            # def removeContextCallback(cb, current=nil)
            # def getChannelState(channelid, current=nil)
            # def setChannelState(state, current=nil)
            # def removeChannel(channelid, current=nil)
            # def addChannel(name, parent, current=nil)
            # def sendMessageChannel(channelid, tree, text, current=nil)
            # def getACL(channelid, current=nil)
            # def setACL(channelid, acls, groups, inherit, current=nil)
            # def addUserToGroup(channelid, session, group, current=nil)
            # def removeUserFromGroup(channelid, session, group, current=nil)
            # def redirectWhisperGroup(session, source, target, current=nil)
            # def getUserNames(ids, current=nil)
            # def getUserIds(names, current=nil)
            # def registerUser(info, current=nil)
            # def unregisterUser(userid, current=nil)
            # def updateRegistration(userid, info, current=nil)
            # def getRegistration(userid, current=nil)
            # def getRegisteredUsers(filter, current=nil)
            # def verifyPassword(name, pw, current=nil)
            # def getTexture(userid, current=nil)
            # def setTexture(userid, tex, current=nil)
            # def getUptime(current=nil)

            def inspect
                ::Ice::__stringify(self, T_Server)
            end
        end
        class Server
            include Server_mixin
            
            def Server.ice_staticId()
                '::Murmur::Server'
            end
        end
        module ServerPrx_mixin

            def isRunning(_ctx=nil)
                Server_mixin::OP_isRunning.invoke(self, [], _ctx)
            end

            def start(_ctx=nil)
                Server_mixin::OP_start.invoke(self, [], _ctx)
            end

            def stop(_ctx=nil)
                Server_mixin::OP_stop.invoke(self, [], _ctx)
            end

            def delete(_ctx=nil)
                Server_mixin::OP_delete.invoke(self, [], _ctx)
            end

            def id(_ctx=nil)
                Server_mixin::OP_id.invoke(self, [], _ctx)
            end

            def addCallback(cb, _ctx=nil)
                Server_mixin::OP_addCallback.invoke(self, [cb], _ctx)
            end

            def removeCallback(cb, _ctx=nil)
                Server_mixin::OP_removeCallback.invoke(self, [cb], _ctx)
            end

            def setAuthenticator(auth, _ctx=nil)
                Server_mixin::OP_setAuthenticator.invoke(self, [auth], _ctx)
            end

            def getConf(key, _ctx=nil)
                Server_mixin::OP_getConf.invoke(self, [key], _ctx)
            end

            def getAllConf(_ctx=nil)
                Server_mixin::OP_getAllConf.invoke(self, [], _ctx)
            end

            def setConf(key, value, _ctx=nil)
                Server_mixin::OP_setConf.invoke(self, [key, value], _ctx)
            end

            def setSuperuserPassword(pw, _ctx=nil)
                Server_mixin::OP_setSuperuserPassword.invoke(self, [pw], _ctx)
            end

            def getLog(first, last, _ctx=nil)
                Server_mixin::OP_getLog.invoke(self, [first, last], _ctx)
            end

            def getLogLen(_ctx=nil)
                Server_mixin::OP_getLogLen.invoke(self, [], _ctx)
            end

            def getUsers(_ctx=nil)
                Server_mixin::OP_getUsers.invoke(self, [], _ctx)
            end

            def getChannels(_ctx=nil)
                Server_mixin::OP_getChannels.invoke(self, [], _ctx)
            end

            def getCertificateList(session, _ctx=nil)
                Server_mixin::OP_getCertificateList.invoke(self, [session], _ctx)
            end

            def getTree(_ctx=nil)
                Server_mixin::OP_getTree.invoke(self, [], _ctx)
            end

            def getBans(_ctx=nil)
                Server_mixin::OP_getBans.invoke(self, [], _ctx)
            end

            def setBans(bans, _ctx=nil)
                Server_mixin::OP_setBans.invoke(self, [bans], _ctx)
            end

            def kickUser(session, reason, _ctx=nil)
                Server_mixin::OP_kickUser.invoke(self, [session, reason], _ctx)
            end

            def getState(session, _ctx=nil)
                Server_mixin::OP_getState.invoke(self, [session], _ctx)
            end

            def setState(state, _ctx=nil)
                Server_mixin::OP_setState.invoke(self, [state], _ctx)
            end

            def sendMessage(session, text, _ctx=nil)
                Server_mixin::OP_sendMessage.invoke(self, [session, text], _ctx)
            end

            def hasPermission(session, channelid, perm, _ctx=nil)
                Server_mixin::OP_hasPermission.invoke(self, [session, channelid, perm], _ctx)
            end

            def addContextCallback(session, action, text, cb, ctx, _ctx=nil)
                Server_mixin::OP_addContextCallback.invoke(self, [session, action, text, cb, ctx], _ctx)
            end

            def removeContextCallback(cb, _ctx=nil)
                Server_mixin::OP_removeContextCallback.invoke(self, [cb], _ctx)
            end

            def getChannelState(channelid, _ctx=nil)
                Server_mixin::OP_getChannelState.invoke(self, [channelid], _ctx)
            end

            def setChannelState(state, _ctx=nil)
                Server_mixin::OP_setChannelState.invoke(self, [state], _ctx)
            end

            def removeChannel(channelid, _ctx=nil)
                Server_mixin::OP_removeChannel.invoke(self, [channelid], _ctx)
            end

            def addChannel(name, parent, _ctx=nil)
                Server_mixin::OP_addChannel.invoke(self, [name, parent], _ctx)
            end

            def sendMessageChannel(channelid, tree, text, _ctx=nil)
                Server_mixin::OP_sendMessageChannel.invoke(self, [channelid, tree, text], _ctx)
            end

            def getACL(channelid, _ctx=nil)
                Server_mixin::OP_getACL.invoke(self, [channelid], _ctx)
            end

            def setACL(channelid, acls, groups, inherit, _ctx=nil)
                Server_mixin::OP_setACL.invoke(self, [channelid, acls, groups, inherit], _ctx)
            end

            def addUserToGroup(channelid, session, group, _ctx=nil)
                Server_mixin::OP_addUserToGroup.invoke(self, [channelid, session, group], _ctx)
            end

            def removeUserFromGroup(channelid, session, group, _ctx=nil)
                Server_mixin::OP_removeUserFromGroup.invoke(self, [channelid, session, group], _ctx)
            end

            def redirectWhisperGroup(session, source, target, _ctx=nil)
                Server_mixin::OP_redirectWhisperGroup.invoke(self, [session, source, target], _ctx)
            end

            def getUserNames(ids, _ctx=nil)
                Server_mixin::OP_getUserNames.invoke(self, [ids], _ctx)
            end

            def getUserIds(names, _ctx=nil)
                Server_mixin::OP_getUserIds.invoke(self, [names], _ctx)
            end

            def registerUser(info, _ctx=nil)
                Server_mixin::OP_registerUser.invoke(self, [info], _ctx)
            end

            def unregisterUser(userid, _ctx=nil)
                Server_mixin::OP_unregisterUser.invoke(self, [userid], _ctx)
            end

            def updateRegistration(userid, info, _ctx=nil)
                Server_mixin::OP_updateRegistration.invoke(self, [userid, info], _ctx)
            end

            def getRegistration(userid, _ctx=nil)
                Server_mixin::OP_getRegistration.invoke(self, [userid], _ctx)
            end

            def getRegisteredUsers(filter, _ctx=nil)
                Server_mixin::OP_getRegisteredUsers.invoke(self, [filter], _ctx)
            end

            def verifyPassword(name, pw, _ctx=nil)
                Server_mixin::OP_verifyPassword.invoke(self, [name, pw], _ctx)
            end

            def getTexture(userid, _ctx=nil)
                Server_mixin::OP_getTexture.invoke(self, [userid], _ctx)
            end

            def setTexture(userid, tex, _ctx=nil)
                Server_mixin::OP_setTexture.invoke(self, [userid, tex], _ctx)
            end

            def getUptime(_ctx=nil)
                Server_mixin::OP_getUptime.invoke(self, [], _ctx)
            end
        end
        class ServerPrx < ::Ice::ObjectPrx
            include ServerPrx_mixin

            def ServerPrx.checkedCast(proxy, facetOrCtx=nil, _ctx=nil)
                ice_checkedCast(proxy, '::Murmur::Server', facetOrCtx, _ctx)
            end

            def ServerPrx.uncheckedCast(proxy, facet=nil)
                ice_uncheckedCast(proxy, facet)
            end
        end

        if not defined?(::Murmur::T_Server)
            T_Server = ::Ice::__declareClass('::Murmur::Server')
            T_ServerPrx = ::Ice::__declareProxy('::Murmur::Server')
        end

        T_Server.defineClass(Server, true, nil, [], [])
        Server_mixin::ICE_TYPE = T_Server

        T_ServerPrx.defineProxy(ServerPrx, T_Server)
        ServerPrx::ICE_TYPE = T_ServerPrx

        Server_mixin::OP_isRunning = ::Ice::__defineOperation('isRunning', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Ice::T_bool, [::Murmur::T_InvalidSecretException])
        Server_mixin::OP_start = ::Ice::__defineOperation('start', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_ServerFailureException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_stop = ::Ice::__defineOperation('stop', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_delete = ::Ice::__defineOperation('delete', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_id = ::Ice::__defineOperation('id', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Ice::T_int, [::Murmur::T_InvalidSecretException])
        Server_mixin::OP_addCallback = ::Ice::__defineOperation('addCallback', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Murmur::T_ServerCallbackPrx], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidCallbackException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_removeCallback = ::Ice::__defineOperation('removeCallback', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Murmur::T_ServerCallbackPrx], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidCallbackException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_setAuthenticator = ::Ice::__defineOperation('setAuthenticator', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Murmur::T_ServerAuthenticatorPrx], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidCallbackException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getConf = ::Ice::__defineOperation('getConf', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_string], [], ::Ice::T_string, [::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getAllConf = ::Ice::__defineOperation('getAllConf', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Murmur::T_ConfigMap, [::Murmur::T_InvalidSecretException])
        Server_mixin::OP_setConf = ::Ice::__defineOperation('setConf', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_string, ::Ice::T_string], [], nil, [::Murmur::T_InvalidSecretException])
        Server_mixin::OP_setSuperuserPassword = ::Ice::__defineOperation('setSuperuserPassword', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_string], [], nil, [::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getLog = ::Ice::__defineOperation('getLog', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int, ::Ice::T_int], [], ::Murmur::T_LogList, [::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getLogLen = ::Ice::__defineOperation('getLogLen', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Ice::T_int, [::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getUsers = ::Ice::__defineOperation('getUsers', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Murmur::T_UserMap, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getChannels = ::Ice::__defineOperation('getChannels', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Murmur::T_ChannelMap, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getCertificateList = ::Ice::__defineOperation('getCertificateList', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int], [], ::Murmur::T_CertificateList, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSessionException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getTree = ::Ice::__defineOperation('getTree', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Murmur::T_Tree, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getBans = ::Ice::__defineOperation('getBans', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Murmur::T_BanList, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_setBans = ::Ice::__defineOperation('setBans', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Murmur::T_BanList], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_kickUser = ::Ice::__defineOperation('kickUser', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Ice::T_int, ::Ice::T_string], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSessionException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getState = ::Ice::__defineOperation('getState', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int], [], ::Murmur::T_User, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSessionException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_setState = ::Ice::__defineOperation('setState', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Murmur::T_User], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSessionException, ::Murmur::T_InvalidChannelException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_sendMessage = ::Ice::__defineOperation('sendMessage', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Ice::T_int, ::Ice::T_string], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSessionException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_hasPermission = ::Ice::__defineOperation('hasPermission', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Ice::T_int, ::Ice::T_int, ::Ice::T_int], [], ::Ice::T_bool, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSessionException, ::Murmur::T_InvalidChannelException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_addContextCallback = ::Ice::__defineOperation('addContextCallback', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Ice::T_int, ::Ice::T_string, ::Ice::T_string, ::Murmur::T_ServerContextCallbackPrx, ::Ice::T_int], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidCallbackException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_removeContextCallback = ::Ice::__defineOperation('removeContextCallback', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Murmur::T_ServerContextCallbackPrx], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidCallbackException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getChannelState = ::Ice::__defineOperation('getChannelState', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int], [], ::Murmur::T_Channel, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidChannelException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_setChannelState = ::Ice::__defineOperation('setChannelState', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Murmur::T_Channel], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidChannelException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_removeChannel = ::Ice::__defineOperation('removeChannel', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Ice::T_int], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidChannelException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_addChannel = ::Ice::__defineOperation('addChannel', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Ice::T_string, ::Ice::T_int], [], ::Ice::T_int, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidChannelException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_sendMessageChannel = ::Ice::__defineOperation('sendMessageChannel', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Ice::T_int, ::Ice::T_bool, ::Ice::T_string], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidChannelException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getACL = ::Ice::__defineOperation('getACL', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int], [::Murmur::T_ACLList, ::Murmur::T_GroupList, ::Ice::T_bool], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidChannelException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_setACL = ::Ice::__defineOperation('setACL', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int, ::Murmur::T_ACLList, ::Murmur::T_GroupList, ::Ice::T_bool], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidChannelException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_addUserToGroup = ::Ice::__defineOperation('addUserToGroup', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int, ::Ice::T_int, ::Ice::T_string], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidChannelException, ::Murmur::T_InvalidSessionException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_removeUserFromGroup = ::Ice::__defineOperation('removeUserFromGroup', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int, ::Ice::T_int, ::Ice::T_string], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidChannelException, ::Murmur::T_InvalidSessionException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_redirectWhisperGroup = ::Ice::__defineOperation('redirectWhisperGroup', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int, ::Ice::T_string, ::Ice::T_string], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSessionException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getUserNames = ::Ice::__defineOperation('getUserNames', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Murmur::T_IdList], [], ::Murmur::T_NameMap, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getUserIds = ::Ice::__defineOperation('getUserIds', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Murmur::T_NameList], [], ::Murmur::T_IdMap, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_registerUser = ::Ice::__defineOperation('registerUser', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Murmur::T_UserInfoMap], [], ::Ice::T_int, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidUserException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_unregisterUser = ::Ice::__defineOperation('unregisterUser', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Ice::T_int], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidUserException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_updateRegistration = ::Ice::__defineOperation('updateRegistration', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int, ::Murmur::T_UserInfoMap], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidUserException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getRegistration = ::Ice::__defineOperation('getRegistration', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int], [], ::Murmur::T_UserInfoMap, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidUserException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getRegisteredUsers = ::Ice::__defineOperation('getRegisteredUsers', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_string], [], ::Murmur::T_NameMap, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_verifyPassword = ::Ice::__defineOperation('verifyPassword', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_string, ::Ice::T_string], [], ::Ice::T_int, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getTexture = ::Ice::__defineOperation('getTexture', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int], [], ::Murmur::T_Texture, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidUserException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_setTexture = ::Ice::__defineOperation('setTexture', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int, ::Murmur::T_Texture], [], nil, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidUserException, ::Murmur::T_InvalidTextureException, ::Murmur::T_InvalidSecretException])
        Server_mixin::OP_getUptime = ::Ice::__defineOperation('getUptime', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Ice::T_int, [::Murmur::T_ServerBootedException, ::Murmur::T_InvalidSecretException])
    end

    if not defined?(::Murmur::MetaCallback_mixin)
        module MetaCallback_mixin
            include ::Ice::Object_mixin

            def ice_ids(current=nil)
                ['::Ice::Object', '::Murmur::MetaCallback']
            end

            def ice_id(current=nil)
                '::Murmur::MetaCallback'
            end

            #
            # Operation signatures.
            #
            # def started(srv, current=nil)
            # def stopped(srv, current=nil)

            def inspect
                ::Ice::__stringify(self, T_MetaCallback)
            end
        end
        class MetaCallback
            include MetaCallback_mixin
            
            def MetaCallback.ice_staticId()
                '::Murmur::MetaCallback'
            end
        end
        module MetaCallbackPrx_mixin

            def started(srv, _ctx=nil)
                MetaCallback_mixin::OP_started.invoke(self, [srv], _ctx)
            end

            def stopped(srv, _ctx=nil)
                MetaCallback_mixin::OP_stopped.invoke(self, [srv], _ctx)
            end
        end
        class MetaCallbackPrx < ::Ice::ObjectPrx
            include MetaCallbackPrx_mixin

            def MetaCallbackPrx.checkedCast(proxy, facetOrCtx=nil, _ctx=nil)
                ice_checkedCast(proxy, '::Murmur::MetaCallback', facetOrCtx, _ctx)
            end

            def MetaCallbackPrx.uncheckedCast(proxy, facet=nil)
                ice_uncheckedCast(proxy, facet)
            end
        end

        if not defined?(::Murmur::T_MetaCallback)
            T_MetaCallback = ::Ice::__declareClass('::Murmur::MetaCallback')
            T_MetaCallbackPrx = ::Ice::__declareProxy('::Murmur::MetaCallback')
        end

        T_MetaCallback.defineClass(MetaCallback, true, nil, [], [])
        MetaCallback_mixin::ICE_TYPE = T_MetaCallback

        T_MetaCallbackPrx.defineProxy(MetaCallbackPrx, T_MetaCallback)
        MetaCallbackPrx::ICE_TYPE = T_MetaCallbackPrx

        MetaCallback_mixin::OP_started = ::Ice::__defineOperation('started', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, false, [::Murmur::T_ServerPrx], [], nil, [])
        MetaCallback_mixin::OP_stopped = ::Ice::__defineOperation('stopped', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, false, [::Murmur::T_ServerPrx], [], nil, [])
    end

    if not defined?(::Murmur::T_ServerList)
        T_ServerList = ::Ice::__defineSequence('::Murmur::ServerList', ::Murmur::T_ServerPrx)
    end

    if not defined?(::Murmur::Meta_mixin)
        module Meta_mixin
            include ::Ice::Object_mixin

            def ice_ids(current=nil)
                ['::Ice::Object', '::Murmur::Meta']
            end

            def ice_id(current=nil)
                '::Murmur::Meta'
            end

            #
            # Operation signatures.
            #
            # def getServer(id, current=nil)
            # def newServer(current=nil)
            # def getBootedServers(current=nil)
            # def getAllServers(current=nil)
            # def getDefaultConf(current=nil)
            # def getVersion(current=nil)
            # def addCallback(cb, current=nil)
            # def removeCallback(cb, current=nil)
            # def getUptime(current=nil)
            # def getSlice(current=nil)
            # def getSliceChecksums(current=nil)

            def inspect
                ::Ice::__stringify(self, T_Meta)
            end
        end
        class Meta
            include Meta_mixin
            
            def Meta.ice_staticId()
                '::Murmur::Meta'
            end
        end
        module MetaPrx_mixin

            def getServer(id, _ctx=nil)
                Meta_mixin::OP_getServer.invoke(self, [id], _ctx)
            end

            def newServer(_ctx=nil)
                Meta_mixin::OP_newServer.invoke(self, [], _ctx)
            end

            def getBootedServers(_ctx=nil)
                Meta_mixin::OP_getBootedServers.invoke(self, [], _ctx)
            end

            def getAllServers(_ctx=nil)
                Meta_mixin::OP_getAllServers.invoke(self, [], _ctx)
            end

            def getDefaultConf(_ctx=nil)
                Meta_mixin::OP_getDefaultConf.invoke(self, [], _ctx)
            end

            def getVersion(_ctx=nil)
                Meta_mixin::OP_getVersion.invoke(self, [], _ctx)
            end

            def addCallback(cb, _ctx=nil)
                Meta_mixin::OP_addCallback.invoke(self, [cb], _ctx)
            end

            def removeCallback(cb, _ctx=nil)
                Meta_mixin::OP_removeCallback.invoke(self, [cb], _ctx)
            end

            def getUptime(_ctx=nil)
                Meta_mixin::OP_getUptime.invoke(self, [], _ctx)
            end

            def getSlice(_ctx=nil)
                Meta_mixin::OP_getSlice.invoke(self, [], _ctx)
            end

            def getSliceChecksums(_ctx=nil)
                Meta_mixin::OP_getSliceChecksums.invoke(self, [], _ctx)
            end
        end
        class MetaPrx < ::Ice::ObjectPrx
            include MetaPrx_mixin

            def MetaPrx.checkedCast(proxy, facetOrCtx=nil, _ctx=nil)
                ice_checkedCast(proxy, '::Murmur::Meta', facetOrCtx, _ctx)
            end

            def MetaPrx.uncheckedCast(proxy, facet=nil)
                ice_uncheckedCast(proxy, facet)
            end
        end

        if not defined?(::Murmur::T_Meta)
            T_Meta = ::Ice::__declareClass('::Murmur::Meta')
            T_MetaPrx = ::Ice::__declareProxy('::Murmur::Meta')
        end

        T_Meta.defineClass(Meta, true, nil, [], [])
        Meta_mixin::ICE_TYPE = T_Meta

        T_MetaPrx.defineProxy(MetaPrx, T_Meta)
        MetaPrx::ICE_TYPE = T_MetaPrx

        Meta_mixin::OP_getServer = ::Ice::__defineOperation('getServer', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [::Ice::T_int], [], ::Murmur::T_ServerPrx, [::Murmur::T_InvalidSecretException])
        Meta_mixin::OP_newServer = ::Ice::__defineOperation('newServer', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [], [], ::Murmur::T_ServerPrx, [::Murmur::T_InvalidSecretException])
        Meta_mixin::OP_getBootedServers = ::Ice::__defineOperation('getBootedServers', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Murmur::T_ServerList, [::Murmur::T_InvalidSecretException])
        Meta_mixin::OP_getAllServers = ::Ice::__defineOperation('getAllServers', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Murmur::T_ServerList, [::Murmur::T_InvalidSecretException])
        Meta_mixin::OP_getDefaultConf = ::Ice::__defineOperation('getDefaultConf', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Murmur::T_ConfigMap, [::Murmur::T_InvalidSecretException])
        Meta_mixin::OP_getVersion = ::Ice::__defineOperation('getVersion', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [::Ice::T_int, ::Ice::T_int, ::Ice::T_int, ::Ice::T_string], nil, [])
        Meta_mixin::OP_addCallback = ::Ice::__defineOperation('addCallback', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Murmur::T_MetaCallbackPrx], [], nil, [::Murmur::T_InvalidCallbackException, ::Murmur::T_InvalidSecretException])
        Meta_mixin::OP_removeCallback = ::Ice::__defineOperation('removeCallback', ::Ice::OperationMode::Normal, ::Ice::OperationMode::Normal, true, [::Murmur::T_MetaCallbackPrx], [], nil, [::Murmur::T_InvalidCallbackException, ::Murmur::T_InvalidSecretException])
        Meta_mixin::OP_getUptime = ::Ice::__defineOperation('getUptime', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Ice::T_int, [])
        Meta_mixin::OP_getSlice = ::Ice::__defineOperation('getSlice', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Ice::T_string, [])
        Meta_mixin::OP_getSliceChecksums = ::Ice::__defineOperation('getSliceChecksums', ::Ice::OperationMode::Idempotent, ::Ice::OperationMode::Idempotent, true, [], [], ::Ice::T_SliceChecksumDict, [])
    end
end
