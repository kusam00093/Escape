//package com.injob.login.service;
//
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.List;
//
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//
//import com.injob.login.domain.UserVo;
//
//import lombok.Getter;
//import lombok.Setter;
//import lombok.ToString;
//
//@Getter
//@Setter
//@ToString
//public class LoginService implements UserDetails {
//
//	private UserVo user;
//
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//		List<GrantedAuthority> roles = new ArrayList<>();
//		roles.add(new GrantedAuthority() {
//			
//			@Override
//			public String getAuthority() {
//				
//				return user.getRole();
//			}
//		});
//		return roles;
//	}
//
//	@Override
//	public String getPassword() {
//		// TODO Auto-generated method stub
//		return user.getUser_passwd();
//	}
//
//	@Override
//	public String getUsername() {
//		
//		return user.getUser_name();
//	}
//
//	@Override
//	public boolean isAccountNonExpired() {
//		
//		return true;
//	}
//
//	@Override
//	public boolean isAccountNonLocked() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	@Override
//	public boolean isCredentialsNonExpired() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	@Override
//	public boolean isEnabled() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//	
//	
//	
//	
//}
